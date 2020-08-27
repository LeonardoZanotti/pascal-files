Program N1_ZANOTTI_23;
// Leonardo José Zanotti

var diaNasc, mesNasc, anoNasc, diaAtual, mesAtual, anoAtual, diaIdade, mesIdade, anoIdade: integer;
var bissexto: boolean;

Begin
bissexto:=false;

write('Escreva o dia de seu nascimento (1-31): ');
readln(diaNasc);

write('Escreva o mês de seu nascimento (1-12): ');
readln(mesNasc);

write('Escreva o ano de seu nascimento (AAAA): ');
readln(anoNasc);

writeln('');

write('Escreva o dia de hoje (1-31): ');
readln(diaAtual);

write('Escreva o mês atual (1-12): ');
readln(mesAtual);

write('Escreva o ano atual (AAAA): ');
readln(anoAtual);

// ----------------------------
	
// Verificando se é bissexto															
if ((anoAtual)mod(4)=0) then
	bissexto:=true;

// Achando os dias	
if (diaNasc<=diaAtual) then
	diaIdade:=diaAtual-diaNasc
else
	begin
	if (mesAtual=02) or (mesAtual=04) or (mesAtual=06) or (mesAtual=08) or (mesAtual=09) or (mesAtual=11) or (mesAtual=01) then
		diaIdade:=31-diaNasc+diaAtual		
	else if (mesAtual=05) or (mesAtual=07) or (mesAtual=10) or (mesAtual=12) then
		diaIdade:=30-diaNasc+diaAtual
	else
		begin
		if (bissexto) then
			diaIdade:=29-diaNasc+diaAtual
		else
      diaIdade:=28-diaNasc+diaAtual;
    end;
  end;
      
// Achando os meses
if (mesNasc=mesAtual) then
	begin
		if (diaNasc<=diaAtual) then
			mesIdade:=mesAtual-mesNasc	// 0
		else 
			mesIdade:=12-mesNasc+mesAtual-1;	// 11
	end
else if (mesNasc<mesAtual) then
	begin
		if (diaNasc<=diaAtual) then
			mesIdade:=mesAtual-mesNasc
		else 
			mesIdade:=mesAtual-mesNasc-1;
	end
else
	begin
	if (diaNasc<=diaAtual) then
		mesIdade:=12-mesNasc+mesAtual
	else
		mesIdade:=12-mesNasc+mesAtual-1;
	end;
		
// Achando os anos
if (mesNasc=mesAtual) then
	begin
		if (diaNasc<=diaAtual) then
			anoIdade:=anoAtual-anoNasc
		else 
			anoIdade:=anoAtual-anoNasc-1;
	end
else if (mesNasc<mesAtual) then
	anoIdade:=anoAtual-anoNasc
else
	anoIdade:=anoAtual-anoNasc-1;
	
clrscr;

writeln('Anos: ', anoIdade);
writeln('Meses: ', mesIdade);
writeln('Dias: ', diaIdade);
readln();
End.