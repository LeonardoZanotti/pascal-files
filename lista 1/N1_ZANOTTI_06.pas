Program N1_ZANOTTI_06;
// Leonardo Jos� Zanotti

var n1, n2, resultado: real;
var op, i: integer;
var operacao: string;

Begin
writeln('Escreva o primeiro n�mero');
readln(n1);
writeln('');

writeln('Escreva o segundo n�mero');
readln(n2);
writeln('');

writeln('------------------');
writeln('Escolha a opera��o');
writeln('[1] Soma');
writeln('[2] Subtra��o');
writeln('[3] Multiplica��o');
writeln('[4] Divis�o');
writeln('------------------');
writeln('');

i:=0;
repeat
	readln(op);
	
	if (op=1) then
		begin
		i:=1;
		operacao:='+';
		resultado:=n1+n2
		end
	else if (op=2) then
	  begin
		i:=1;
	  operacao:='-';
	  resultado:=n1-n2
		end
	else if (op=3) then
	  begin
		i:=1;
	  operacao:='*';
	  resultado:=n1*n2
		end
	else if (op=4) then
	  begin
		i:=1;
	  operacao:='/';
	  resultado:=n1/n2
		end
	else
		writeln('Escolha uma das op��es!');
until (i=1);

clrscr;

writeln(n1:8:2, ' ', operacao, ' ', n2:8:2, ' = ', resultado:8:2);
readln()                                                                
End.