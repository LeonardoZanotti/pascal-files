Program N1_ZANOTTI_19;
// Leonardo José Zanotti

var maior, menor, altura: real;

Begin
write('Escreva a altura que quer cadastrar: ');
	readln(altura);
	clrscr;
	maior:=altura;
	menor:=altura;

repeat
	begin
	write('Escreva a altura que quer cadastrar: ');
	readln(altura);
	clrscr;
	
	if (altura>maior) then
		maior:=altura;
	if (altura<menor) and (altura>=0) then
		menor:=altura;
	end;
until altura<0;  

writeln('Maior altura: ', maior:2:2);
writeln('Menor altura: ', menor:2:2);
End.