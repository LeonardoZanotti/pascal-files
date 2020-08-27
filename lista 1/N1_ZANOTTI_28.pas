Program N1_ZANOTTI_28;
// Leonardo José Zanotti

var menor, maior, i: integer;

Begin
i:=0;

write('Escreva o limite superior: ');  
readln(maior);
writeln('');

repeat
	begin
	write('Escreva o limite inferior: ');
	readln(menor);
	
	if (menor>maior) then
		begin
		writeln('Escreva um número menor ou igual ao limite superior!');
		writeln('');
		end
	else
		i:=1;
	end;
until i=1;

clrscr;

for i:=menor+1 to maior-1 do
	begin
		if ((i)mod(2)=0) then
			writeln(i);
	end;
readln();
End.