Program N1_ZANOTTI_21;
// Leonardo Jos� Zanotti

var num, uni, dez, cen: integer;

Begin
	write('Escreva um n�mero de 3 d�gitos: ');
	readln(num);
	
	if (num<100) or (num>999) then
		writeln('Esse n�mero n�o tem 3 d�gitos!')
	else
		begin
		cen:=num div 100;
		num:=num-100*cen;
		dez:=num div 10;
		uni:=num-10*dez;
		
		writeln(uni, dez, cen);
		readln();
		end;
End.