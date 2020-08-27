Program N1_ZANOTTI_22_PROFESSOR;
// Leonardo José Zanotti

var dia, mes, ano, dmax: integer;
var key: boolean;

Begin
	key:=true;
	write('Dia: ');
	readln(dia);
	write('Mês: ');
	readln(mes);
	write('Ano: ');
	readln(ano);
	
	clrscr;
	
	if (ano<1940) or (ano>2006) then
		key:=false
	else if (mes<1) or (mes>12) then
			key:=false
	else
		begin
			dmax:=31;
			if (mes=4) or (mes=6) or (mes=9) or (mes=11) then
				dmax:=30;
				if (mes=2) then
					dmax:=28;
					if ((ano)mod(4)=0) then
						dmax:=29;
		end;
	if (dia<1) or (dia>dmax) then
		key:=false;
		
	if (key) then
		writeln(dia, '/', mes, '/', ano, ' é uma data válida')
	else
	  writeln(dia, '/', mes, '/', ano, ' é uma data inválida');
End.           