Program N1_ZANOTTI_06;
// Leonardo José Zanotti

var n1, n2, resultado: real;
var op, i: integer;
var operacao: string;

Begin
writeln('Escreva o primeiro número');
readln(n1);
writeln('');

writeln('Escreva o segundo número');
readln(n2);
writeln('');

writeln('------------------');
writeln('Escolha a operação');
writeln('[1] Soma');
writeln('[2] Subtração');
writeln('[3] Multiplicação');
writeln('[4] Divisão');
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
		writeln('Escolha uma das opções!');
until (i=1);

clrscr;

writeln(n1:8:2, ' ', operacao, ' ', n2:8:2, ' = ', resultado:8:2);
readln()                                                                
End.