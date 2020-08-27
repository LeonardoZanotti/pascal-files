Program N1_ZANOTTI_24;
// Leonardo José Zanotti

var i, a, b: integer;
var resultado: real;

Begin
resultado:=1;

write('Escreva a base: ');
readln(a);
writeln('');

write('Escreva o expoente: ');
readln(b);
writeln('');

clrscr;

if (b>=0) then
	begin
		for i:=1 to b do
			resultado:=resultado*a;
		writeln(a, ' elevado a ', b, ' é igual a ', resultado:8:3);
	end
else
	if (a=0) then
		writeln('A base não pode ser zero nesse caso')
	else
		begin
		for i:=-1 downto b do
			resultado:=resultado*(1/a);
		writeln(a, ' elevado a ', b, ' é igual a ', resultado:8:3);
		end;

readln();
End.