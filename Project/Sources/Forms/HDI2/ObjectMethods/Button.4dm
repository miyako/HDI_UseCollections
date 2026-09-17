C_COLLECTION:C1488(col1; col2; col3)

col1:=New collection:C1472(12; "alpha"; "zoulou"; 45)
col2:=New collection:C1472(50; "bravo"; col1; !2017-05-12!)
col3:=New collection:C1472(col1; col2)

vString:=JSON Stringify:C1217(col1; *)
