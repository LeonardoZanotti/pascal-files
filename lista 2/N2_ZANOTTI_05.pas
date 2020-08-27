Program N2_ZANOTTI_05;
// Leonardo José Zanotti

var a, b, c, d: integer;
var vetor: array[1..3, 1..5, 1..3] of integer;

Begin
for c:=1 to 3 do
	for b:=1 to 5 do
		for a:=1 to 3 do
			vetor[a, b, c]:=a*b*c;
			
for c:=1 to 3 do
	begin
		gotoxy(30, -3+5*c);
		writeln('Plano: ', c);
		for b:=1 to 5 do
			for a:=1 to 3 do
				begin
					if (c=1) then
						d:=a
						else if (c=2) then
							d:=a+5
							else
								d:=a+10;
					gotoxy(b*3, d);
					write(vetor[a, b, c]);
				end;
	end;		
readln();  
End.