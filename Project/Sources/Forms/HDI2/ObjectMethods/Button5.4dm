C_OBJECT:C1216(obj)
C_COLLECTION:C1488(col1; col2)

//TRACE

col1:=New collection:C1472(10; 12; 18; 24)
col2:=New collection:C1472("Arial"; "Times"; "Verdana")

OB SET:C1220(obj; "sizes"; col1)
OB SET:C1220(obj; "fonts"; col2)

// ----------------

col1:=New collection:C1472
col2:=New collection:C1472

col1:=OB Get:C1224(obj; "sizes")
col2:=OB Get:C1224(obj; "fonts")
