Program N1_ZANOTTI_09;
// Leonardo Jos� Zanotti

var a, b, i: integer;

Begin
i:=0;

repeat
	begin
		writeln('Escolha um n�mero entre 1 e 10 que irei mostrar a tabuada desse n�mero');
		readln(a);
		writeln('');
		
		if (a>0) and (a<11) then
			i:=1
	end
until i=1;

writeln('');
writeln('Tabuada do ',a);
for b:=1 to 10 do
	writeln(a, ' x ', b, ' = ', a*b);

End.