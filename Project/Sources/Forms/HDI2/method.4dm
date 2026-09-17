C_LONGINT:C283($p)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		initHDI
		
		//ALL RECORDS([SAMPLES])
		//ORDER BY([SAMPLES]; [SAMPLES]SampleSort; >)
		//GOTO SELECTED RECORD([SAMPLES]; 1)
		
		//vHDI:=[SAMPLES]Text
		
		vString:=""
		vstring1:=""
		vstring2:="[45,78,99,\"charlie\",456]"
		
		vNum:=0
		vString:=""
		objStr:=""
		boo:=False:C215
		
	: (Form event code:C388=On Page Change:K2:54)
		
		$p:=FORM Get current page:C276
		
		vHDI:=_TextTabControl{$p}
		vString:=""
		vNum:=0
		boo:=False:C215
		obj:=New object:C1471
		col:=New collection:C1472
		
	: (Form event code:C388=On Unload:K2:2)
		
End case 

