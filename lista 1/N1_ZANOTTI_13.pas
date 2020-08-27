Program N1_ZANOTTI_13;
// Leonardo José Zanotti

var notas: array[1..50] of integer;
var i, ok: integer;
var media: real;

Begin
i:=1;
ok:=0;
media:=0;

while i<=50 do
	begin
		repeat
			begin
				write('Escreva a ', i,'° nota: ');
				readln(notas[i]);
				
				if (0<=notas[i]) and (notas[i]<=100) then
					begin
					media:=(media+((notas[i])/50));
					i:=i+1;
					ok:=1;
					end;
			end;
		until ok=1;
		clrscr;
	end;
	
writeln('A média das notas é: ', media:3:2);
readln()  
End.