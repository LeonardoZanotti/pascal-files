Program N1_ZANOTTI_05;
// Leonardo Jos� Zanotti

var anoAtual, anoNasc, idade: integer;
var situacao: string;

Begin
writeln('Em que ano estamos?');
readln(anoAtual);

writeln('Em que ano voc� nasceu?');
readln(anoNasc);

idade:=anoAtual-anoNasc;

if (idade>=16) then
	begin
	situacao:='e j� pode votar';
	
	if(idade>=18) then
		situacao:='e j� pode votar e ser preso'
	end
else
	situacao:='e n�o pode votar nem ser preso';
	
writeln('');
writeln('Voc� provavelmente tem ', idade, ' anos ', situacao);
readln()
End.