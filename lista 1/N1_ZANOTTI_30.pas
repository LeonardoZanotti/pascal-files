Program N1_ZANOTTI_30;
// Leonardo José Zanotti

var num: array[1..20] of integer;
var key: boolean;
var i: integer;

Begin
key:=true;

for i:=1 to 20 do
	begin
	write('Escreva o número: ');
	readln(num[i]);
	clrscr;
		if (num[i]=5555) then
			i:=21;
  end;
	
	for i:=1 to 20 do
	begin
		if (num[i]=5555) then
			begin
			writeln(num[i]);
			i:=21;
			end
		else if (num[i]<>5000) and (key) then
			writeln(num[i])
		else if (num[i]<>5000) and (not key) then
			writeln('-')
		else if (num[i]=5000) and (key) then
			begin
			writeln(num[i]);
			key:=false;
			end
		else if (num[i]=5000) and (not key) then
			begin
			writeln(num[i]);
			key:=true;
			end;
	end;   
End.