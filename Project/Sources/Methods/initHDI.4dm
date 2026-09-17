//%attributes = {"invisible":true}
ARRAY TEXT:C222(_TabControl; 0)
ARRAY TEXT:C222(_TextTabControl; 0)

If (Get database localization:C1009(Current localization:K5:22)="ja")
	$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("SAMPLES-ja.json").getText())
Else 
	$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("SAMPLES-en.json").getText())
End if 

$json:=$json.orderBy("SampleSort asc")
COLLECTION TO ARRAY:C1562($json; _TabControl; "Title"; _TextTabControl; "Text")

//ALL RECORDS([SAMPLES])
//ORDER BY([SAMPLES]; [SAMPLES]SampleSort; >)
//SELECTION TO ARRAY([SAMPLES]Title; _TabControl; [SAMPLES]Text; _TextTabControl)
//UNLOAD RECORD([SAMPLES])

vHDI:=$json.first().Text
