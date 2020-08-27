Program N1_ZANOTTI_05;
// Leonardo José Zanotti

var anoAtual, anoNasc, idade: integer;
var situacao: string;

Begin
writeln('Em que ano estamos?');
readln(anoAtual);

writeln('Em que ano você nasceu?');
readln(anoNasc);

idade:=anoAtual-anoNasc;

if (idade>=16) then
	begin
	situacao:='e já pode votar';
	
	if(idade>=18) then
		situacao:='e já pode votar e ser preso'
	end
else
	situacao:='e não pode votar nem ser preso';
	
writeln('');
writeln('Você provavelmente tem ', idade, ' anos ', situacao);
readln()
End.