Program N1_ZANOTTI_18;
// Leonardo José Zanotti
// O Pascalzim parece levar mais que 1 segundo pra ler o código e mostrar na tela, por isso ele trava depois de um tempo

var minuto, segundo, segundoTeste, msegundoTeste, h, m, s, ms: integer;

Begin
writeln('Contagem regressiva de 10 minutos');
writeln('10:00');
for minuto:=09 downto 00 do
	begin
	for segundo:=59 downto 00 do
		begin

{ Isso aq não funciona pq n pega a variação dos segundos 59 pra 00. Só com os ms o programa roda tudo direto sem esperar
		GetTime(h, m, s, ms);
		segundoTeste:=s+1;
		msegundoTeste:=ms;
		repeat	
			GetTime(h, m, s, ms);
		until (s>=segundoTeste) and (ms>=msegundoTeste);
}

		delay(1000);  // procedimento que suspende o processamento por 1 segundo (1 segundo tem 1000 milesegundos)
		gotoxy(1,2);  // procedimento que posiciona o apontador na coluna 1, linha 2 do monitor
		writeln(minuto:2:0,':',segundo:2:0);	// substitui o tempo escrito pelo novo  
		end;
	end;              	
End.