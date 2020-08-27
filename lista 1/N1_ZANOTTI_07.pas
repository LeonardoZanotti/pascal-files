Program N1_ZANOTTI_07;
// Leonardo José Zanotti

var weight, height, imc: real;
var condicao: string;

Begin
writeln('Manda tua altura aekk');
readln(height);
writeln('');

writeln('Beleza, agora lança teu peso ae');
readln(weight);
writeln('');

imc:=(weight/sqr(height));

if (imc<=18.5) then
	condicao:='fiddlesticks'
	
else if (imc>18.5) and (imc<=25) then
	condicao:='mec mec tranquilin'
	
else if (imc>25) and (imc<=30) then
	condicao:='Gordo beleza churrasco'                        
	
else
	condicao:='GORDASSO';

writeln('Teu Índice de massa corporal é: ', imc:2:2, ' e tua condição é: ', condicao);
readln()  
End.