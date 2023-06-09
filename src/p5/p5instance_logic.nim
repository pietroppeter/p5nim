import std / [macros, macrocache]
from std/strutils import `%`
import strformat

import p5types

const Arg = "p5Inst"
const WrappedProcs = CacheSeq"p5Procs"
const P5InstanceFields = CacheSeq"p5Fields"

static:
  var tmp = new P5Instance
  for field, typ in fieldPairs(tmp[]):
    P5InstanceFields.add ident(field)

proc contains(ct: CacheSeq, s: NimNode): bool =
  ## XXX: think about this. Maybe better to use a real table so we don't pay the
  ## price for this. Or just use a CT table for O(1) lookup?
  for x in ct:
    if x == s: return true

proc replaceCallsImpl(n: NimNode): NimNode
proc maybeReplaceCall(n: NimNode): NimNode =
  ## Checks if this node refers to a known procedure wrapped by `globalAndLocal`.
  ## If so, generate a call:
  ##
  ## `n(p5Inst, <other args>)`
  ##
  ## to call the correct overload.
  doAssert n.kind in {nnkCall, nnkDotExpr}
  # Note: `nnkDotExpr` *may* be a call
  proc getName(n: NimNode): NimNode =
    ## helper to extract the name from the following cases:
    ## - nnkCall with an ident as first child: `ellipse(mouseX, mouseY, ...)`
    ## - nnkCall with a nnkDotExpr as first child: `mouseX.ellipse(mouseY, ...)`
    ## - pure nnkDotExpr (which may be a call): `fillBy.fill`
    case n.kind
    of nnkIdent, nnkSym: result = n
    of nnkCall: result = getName(n[0])
    of nnkDotExpr: result = getName(n[1]) # if it refers to a call, 2nd child is call
    of nnkBracketExpr: result = getName(n[0]) # generic function like newSeq[float]
    else: doAssert false, &"Invalid branch ({n.kind}) as `maybeReplaceCall` expects nnkCall or nnkDotExpr"

  let name = getName(n)
  let nameIsWrapped = name in WrappedProcs
  if n.kind == nnkDotExpr and nameIsWrapped:
    # rewrite e.g.: `fillBy.fill` -> `fill(p5Inst, fillBy)`
    let dotArg0 = replaceCallsImpl(n[0]) # the initial first elemen, e.g. `fillBy` in above
    result = nnkCall.newTree(name,
                             ident(Arg),
                             dotArg0)
    # NOTE: If I'm not missing something we can never have an `nnkDotExpr`, where the
    # second child is a field of a P5Instance. In that case the first child would
    # already refer to some instance (or the code would just be invalid)
  elif n[0].kind == nnkDotExpr and nameIsWrapped:
    # rewrite `mouseX.ellipse(mouseY, ...)` to `ellipse(p5Inst, mouseX, ...)` (and checking args)
    let dotArg0 = replaceCallsImpl(n[0][0]) # the initial first element, e.g. `mouseX` in above
    result = nnkCall.newTree(name,
                             ident(Arg),
                             dotArg0)
    # now possibly replace remaining
    for i in 1 ..< n.len:
      let ch = n[i]
      result.add replaceCallsImpl(ch)
    # NOTE: this branch and the below could also be handled differently relying on recursing
    # back to `replaceCallsImpl`, but this way is more obvious I believe
  elif nameIsWrapped:
    result = nnkCall.newTree()
    # first replace all possible arguments
    for ch in n:
      result.add replaceCallsImpl(ch)
    # now insert the p5 instance argument
    result.insert(1, ident(Arg)) # insert argument as first (0 is name of fn)
  else:
    result = n

proc maybeReplaceSym(n: NimNode): NimNode =
  ## Checks if this node refers to a field of the `P5Instance` type. If so
  ## wrap it in a
  ##
  ## `p5Inst.n`
  ##
  ## dot expression to access the appropriate field or else leave it alone.
  doAssert n.kind in {nnkSym, nnkIdent}
  if n in P5InstanceFields:
    result = nnkDotExpr.newTree(ident(Arg), n)
  else:
    result = n

proc replaceCallsImpl(n: NimNode): NimNode =
  ## Recursively walks the NimNode tree and possibly replaces calls and
  ## syms if they appear either as a field of the `P5Instance` or
  ## they were wrapped by the `globalAndLocal` macro.
  if n.len == 0:
    case n.kind
    of nnkIdent, nnkSym: result = maybeReplaceSym(n)
    else: result = n
  else:
    result = newTree(n.kind)
    for ch in n:
      case ch.kind
      of nnkCall, nnkDotExpr:
        result.add maybeReplaceCall(ch)
      else:
        result.add replaceCallsImpl(ch)

macro replaceCalls(body: untyped): untyped =
  ## Performs replacement of all function / field symbols used in the given
  ## `body` based on known fields of `P5Instance` / wrapped procedures with
  ## a `P5Instance` first argument for usage in `instance` templates.
  result = newStmtList()
  result.add replaceCallsImpl(body)

macro globalAndLocal*(args: untyped): untyped =
  ## Generates all given procedures as `importc` once for the global case
  ## and once as methods / attributes of a `P5Instance`.
  ##
  ## Each generated procedure is added to the `WrappedProcs` `CacheSeq` to
  ## allow us to replace calls to them within the `instance` template.
  # basic pragma string for the instance case, as we ``have`` to generate the
  # call as a dot expression and not a regular call with a `p5` first argument
  let pragmaStr = "#.$#(@)"
  let localArg = nnkIdentDefs.newTree(ident"p5", ident"P5Instance", newEmptyNode())
  result = newStmtList()
  for arg in args: # walk all given procs
    doAssert arg.kind == nnkProcDef
    result.add arg # global version
    # mutable copy and add argument
    var marg = arg.copy()
    let name = marg.name
    let pragmaArg = pragmaStr % [name.strVal] # generate correct importcpp pragma string
    let pragma = nnkPragma.newTree(nnkExprColonExpr.newTree(ident"importcpp", newLit(pragmaArg)))
    var params = marg.params
    # insert param at position 1, pushing all others back
    params.insert(1, localArg)
    marg.params = params
    marg.pragma = pragma
    result.add marg
    # add the name of this procedure to list of "save to lift" procedures
    WrappedProcs.add name

template instanceImpl(): untyped {.dirty.} =
  # bind `replaceCalls`, because the whole AST of `instance` will appear in the
  # user's calling scope where `replaceCalls` is not defined
  bind replaceCalls
  # shadow global setup and draw with local one. It redefines the existing templates by
  # a version which sets the given body to a closure assigned to the instance field
  # of the same name. In the body of each we will replace calls & dot expressions by
  # the corresponding methods of the p5 instance. For symbols / idents we encounter
  # we also may replace them if their name matches a field of the `P5Instance` type.
  template setup(bd: untyped): untyped =
    p5Inst.setup = proc() =
      replaceCalls(bd)

  template draw(bd: untyped): untyped =
    p5Inst.draw = proc() =
      replaceCalls(bd)

  template preload(bd: untyped): untyped =
    p5Inst.preload = proc() =
      replaceCalls(bd)
  ## XXX: define all templates from `p5sugar.nim`?

template instance*(divName: untyped, body: untyped): untyped =
  ## Generates an instance of a `P5Instance` for the "instance mode". The instance
  ## will be placed into the HTML <div> `divName`. The `divName` should be
  ## a `string`, but it's `untyped` to avoid early processnig of the two
  ## `instance` templates!
  # create the closure & generate a new instance from the given closure
  instanceImpl()
  # Inject the `p5Inst` argument so it's accessible by the user, but
  # importantly by the `setup`, `draw` templates
  let s = proc(p5Inst {.inject.}: P5Instance) {.closure.} = body
  let p5Inst = newInstance(s, divName)

template instance*(body: untyped): untyped =
  ## Generates an instance of a `P5Instance` for the "instance mode".
  instanceImpl()
  # Inject the `p5Inst` argument so it's accessible by the user, but
  # importantly by the `setup`, `draw` templates
  let s = proc(p5Inst {.inject.}: P5Instance) {.closure.} = body
  let p5Inst = newInstance(s)
