Program N1_ZANOTTI_17;
// Leonardo José Zanotti

var i, storage: integer;
Begin

storage:=0;

for i:=1 to 500 do
	begin
		if ((i)mod(2)<>0) and ((i)mod(3)=0) then
			storage:=storage+i;
	end;

writeln(storage);
readln();  
End.