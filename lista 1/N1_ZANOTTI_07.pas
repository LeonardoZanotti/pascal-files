Program N1_ZANOTTI_07;
// Leonardo Jos� Zanotti

var weight, height, imc: real;
var condicao: string;

Begin
writeln('Manda tua altura aekk');
readln(height);
writeln('');

writeln('Beleza, agora lan�a teu peso ae');
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

writeln('Teu �ndice de massa corporal �: ', imc:2:2, ' e tua condi��o �: ', condicao);
readln()  
End.