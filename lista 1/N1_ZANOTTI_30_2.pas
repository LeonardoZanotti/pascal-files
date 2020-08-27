Program N1_ZANOTTI_30_2;
// Leonardo José Zanotti

var num: integer;
var key: boolean;

Begin
key:=true;

repeat
	begin
	write('Escreva o número: ');
	readln(num);
	
	if (num<>5000) and (key) then
		writeln(num:20)
	else if (num=5000) and (key) then
		begin
		writeln(num:20);
		key:=false;
		end
	else if (num=5000) and (not key) then
		begin
		writeln(num:20);
		key:=true;		
		end;
	end;
until num=5555;  
End.