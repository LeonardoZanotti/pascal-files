Program N2_ZANOTTI_04;
// Leonardo José Zanotti

var a, b, c: integer;
var vetor: array[1..3, 1..5] of integer;

Begin
for a:=1 to 3 do
	for b:=1 to 5 do
		begin
			gotoxy(b*3, a);
			readln(vetor[a, b]);
		end;
		
for b:=1 to 5 do
	for a:=1 to 3 do
		begin
			c:=b+5;
			gotoxy(a*3, c);
			write(vetor[a, b]);
		end;
		
readln();  
End.