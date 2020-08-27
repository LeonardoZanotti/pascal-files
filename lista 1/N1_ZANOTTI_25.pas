Program N1_ZANOTTI_25;
// Leonardo José Zanotti

var a, b, i, fim: integer;
var ponto, resultado: string;

Begin
a:=0;
b:=0;
i:=1;
fim:=0;

repeat
	begin
		// Lendo o ponto
		writeln('Quem fez o ', i, '° ponto?');
		writeln('[A] - ', a, ' pontos');
		writeln('[B] - ', b, ' pontos');
		readln(ponto);
		
		// Contabilizando pontos
		if (ponto='A') then
			begin
			a:=a+1;
			i:=i+1;
			clrscr;
			end
		else if (ponto='B') then
			begin
			b:=b+1;
			i:=i+1;
			clrscr;
			end  
		else
			begin
			clrscr;
			writeln('Time inválido!');
			writeln('');
			end;
			
		// Determinando fim de jogo
		if (a>=25) or (b>=25) then
			if (a-b>=2) then
				begin
				fim:=1;
				resultado:='O time A venceu!';
				end
			else if (b-a>=2) then
				begin
				fim:=1;
				resultado:='O time B venceu!';
				end
			else
				writeln('O time que abrir 2 pontos de vantagem vence!');				 				
	end;
until fim=1;

// Fim de jogo
clrscr;
writeln('FIM DE JOGO!');
writeln(resultado);
writeln('');
writeln('[A] - ', a, ' x ', b, ' - [B]');
readln();
End.