Program N1_ZANOTTI_21;
// Leonardo José Zanotti

var num, uni, dez, cen: integer;

Begin
	write('Escreva um número de 3 dígitos: ');
	readln(num);
	
	if (num<100) or (num>999) then
		writeln('Esse número não tem 3 dígitos!')
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