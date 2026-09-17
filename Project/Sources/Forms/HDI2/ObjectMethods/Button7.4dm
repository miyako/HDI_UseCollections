var $i; $n; $nbBool; $nbText; $nbReal; $nbObject; $nbNull; $nbUndefined; $type : Integer


$nbBool:=0
$nbText:=0
$nbObject:=0
$nbReal:=0
$nbNull:=0
$nbUndefined:=0

col:=New collection:C1472

col[0]:="Alpha"
col[2]:=False:C215
col[4]:="Bravo"
col[6]:=48.6
col[10]:=New object:C1471("a"; "alpha")
col[13]:=True:C214
col[17]:=999
col[23]:=New object:C1471("z"; "zoulou")

$n:=col.length

For ($i; 0; $n-1)
	
	If (Not:C34(Undefined:C82(col[$i])))
		
		$type:=Value type:C1509(col[$i])
		Case of 
			: ($type=Is text:K8:3)
				$nbText:=$nbText+1
			: ($type=Is real:K8:4)
				$nbReal:=$nbReal+1
			: ($type=Is boolean:K8:9)
				$nbBool:=$nbBool+1
			: ($type=Is object:K8:27)
				$nbObject:=$nbObject+1
			: ($type=Is null:K8:31)
				$nbNull:=$nbNull+1
		End case 
	Else 
		$nbUndefined:=$nbUndefined+1
	End if 
End for 

vString:="The collection contains "+String:C10($n)+" items."
vString:=vString+" ("+String:C10($nbBool)+" booleans, "+String:C10($nbText)+" texts, "+String:C10($nbObject)+" objects, "+String:C10($nbReal)+" reals, "+String:C10($nbNull)+" nulls, "+String:C10($nbUndefined)+" undefined.)"
