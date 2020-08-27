Program N1_ZANOTTI_22;
// Leonardo José Zanotti

var dia, mes, ano, bissexto: integer;

Begin
write('Escreva o dia (1-31): ');
readln(dia);
writeln('');

write('Escreva o mês (1-12): ');
readln(mes);
writeln('');

write('Escreva o ano (AAAA): ');
readln(ano);
writeln('');

if ((ano)mod(4)=0) then
	bissexto:=1;
	
if (mes>=01) and (mes<=12) then
	begin
		if (mes=01) or (mes=03) or (mes=05) or (mes=07) or (mes=08) or (mes=10) or (mes=12) then
		  begin
			if(0<dia) and (dia<=31) then
		  	writeln('Válido: ', dia,'/',mes,'/',ano)
			else
				writeln('Dia incorreto');
			end
		else if (mes=04) or (mes=06) or (mes=09) or (mes=11) then
			begin
			if(0<dia) and (dia<=30) then
		  	writeln('Válido: ', dia,'/',mes,'/',ano)
			else
				writeln('Dia incorreto');		
			end
		else
			begin
			if (bissexto=1) then
				begin
				if(0<dia) and (dia<=29) then
		  		writeln('Válido: ', dia,'/',mes,'/',ano)
				else
					writeln('Dia incorreto');
				end
			else
				begin
				if(0<dia) and (dia<=28) then
		  		writeln('Válido: ', dia,'/',mes,'/',ano)
				else
					writeln('Dia incorreto');
				end;
			end; 			
	end
else
	writeln('Mês incorreto!');	
End.