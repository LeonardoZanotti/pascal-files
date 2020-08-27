Program N1_ZANOTTI_15;
// Leonardo José Zanotti

var a, b, total: integer;

Begin
total:=0;

write('Escreva o número: ');
readln(a);
clrscr;

repeat
	begin
		write('Escreva seu chute: ');
		readln(b);
		
		total:=total+1;
		
		if (a-b>=1000) or (b-a>=1000) then
			writeln('Muito frio')
		else if (a-b>=100) or (b-a>=100) then
			writeln('Frio')
		else if (a-b>=10) or (b-a>=10) then
			writeln('Quentinhozinho')
		else
			writeln('CHURRASQUEIRA A CONTROLE REMOTO');	
	end
until b=a;

clrscr;

writeln('Você chegou na resposta ', a, ' em ', total, ' tentativas');
readln();  
End.