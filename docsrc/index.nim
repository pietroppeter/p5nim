import std / [os, algorithm, sugar, strformat, strutils, tables]
import nimib except toJson  # we need to remove this from nimib exports! it breaks jsony!
import jsony

type
  Entry* = object
    filename: string
    title: string
    description: string
    numbering: int
  Index* = object
    data: seq[Entry]

proc sort*(idx: var Index) =
  idx.data.sort do (e, f: Entry) -> int:
    cmp(e.numbering, f.numbering)

proc dump*(idx: Index) =
  var idx = idx
  sort(idx)
  writeFile("index.json", jsony.toJson(idx))

proc loadIndex*: Index =
  if fileExists("index.json"):
    result = "index.json".readFile.fromJson(Index)
  else:
    result = Index()
  sort result

# requires nb: NbDoc
proc addEntry*(nb: var NbDoc, numb: int, titl, desc: string) =
  let e = Entry(numbering: numb, title: titl, description: desc, filename: nb.filename)
  var idx = loadIndex()
  var found = false
  for f in idx.data.mitems:
    if f.filename == e.filename:
      f = e
      found = true
  if not found:
    idx.data.add e
  dump idx
  let text = "## " &  $(e.numbering) & ". " & e.title & "\n" & e.description
  nbText: text

when isMainModule:
  nbInit
  nbText: "## nimp5 documentation"
  let idx = loadIndex()
  var
    listEntries = ""
  for entry in idx.data:
    listEntries.add fmt"{entry.numbering}. [{entry.title}]({entry.filename}): {entry.description}" & "\n"
  nbText: listEntries
  nbSave