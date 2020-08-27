Program N1_ZANOTTI_16;
// Leonardo José Zanotti

var voto: string;
var a, b, c, branco, invalido, total: integer;

Begin
a:=0;
b:=0;
c:=0;
branco:=0;          
invalido:=0;
total:=0;

repeat
	writeln('Qual seu voto?');
	writeln('[A]   [B]   [C]   [ ]');
	writeln(' * para sair ');
	readln(voto);
	voto:=upcase(voto);
	clrscr;
	
	total:=total+1;
	
	if (voto='A') then
		a:=a+1
	else if (voto='B') then
		b:=b+1
	else if (voto='C') then
		c:=c+1
	else if (voto=' ') then
		branco:=branco+1
	else if (voto='*') then
		total:=total-1	
	else
		begin
		writeln('Voto inválido');
		invalido:=invalido+1;
		end;	
until voto='*';

clrscr;

writeln('Votações encerradas!');
writeln('Total de votos: ', total);
writeln('Votos para o candidato A: ', a, ' - ', ((a*100)/total):3:2, '%');
writeln('Votos para o candidato B: ', b, ' - ', ((b*100)/total):3:2, '%');
writeln('Votos para o candidato C: ', c, ' - ', ((c*100)/total):3:2, '%');
writeln('Votos em branco: ', branco, ' - ', ((branco*100)/total):3:2, '%');
writeln('Votos inválidos: ', invalido, ' - ', ((invalido*100)/total):3:2, '%');

writeln('');

if (a>=b) and (a>=c) then
	writeln('Candidato vencedor: A')
else if (b>=a) and (b>=c) then
	writeln('Canditado vencedor: B')
else
	writeln('Candidato vencedor: C');
readln();  
End.