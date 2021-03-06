(* ::Package:: *)

VerificationTest[
  MatchQ[
    List @@ DevTools`Events`$paclet
  , KeyValuePattern[{ "Name" -> "DevTools", "Version" -> _String}]  
  ]
, True
, TestID -> "$paclet exists?"
]


VerificationTest[
  FileExistsQ @ 
  DevTools`Events`ResourcePath[DevTools`Events`$paclet, "CodeTemplates"]
, True
, TestID -> "FileExistsQ@DevTools`Events`Reso..."
]


(* ::Section:: *)
(*Utilities*)


VerificationTest[
  DevTools`Events`AddToCurrentValue[$FrontEnd, NotebookEventActions, "new" -> 1 ];
  CurrentValue[$FrontEnd, NotebookEventActions] // KeyExistsQ["new"]
, True
, TestID -> "DevTools`Events`AddToCurrentValue[$FrontEnd,NotebookEventActions..."
]


VerificationTest[
  DevTools`Events`DropFromCurrentValue[$FrontEnd, NotebookEventActions, "new" ];
CurrentValue[$FrontEnd, NotebookEventActions]//KeyExistsQ["new"]
, False
, TestID -> "DevTools`Events`DropFromCurrentValue[$FrontEnd,NotebookEventActi..."
]


(* ::Section:: *)
(*templates*)


VerificationTest[
  DevTools`Events`NeedsResource[
  DevTools`Events`$paclet
, "CodeTemplates" 
] // MatchQ[{DevTools`Events`$minimalTemplatePattern..}]
, True
, TestID -> "need code templates"
]


VerificationTest[
  DevTools`Events`ResetResource[
  DevTools`Events`$paclet
, "CodeTemplates" 
] // MatchQ[{DevTools`Events`$minimalTemplatePattern..}]
, True
, TestID -> "reset code templates"
]


DevTools`Events`ResetResource[
  DevTools`Events`$paclet
, "NotebookActions" 
]
