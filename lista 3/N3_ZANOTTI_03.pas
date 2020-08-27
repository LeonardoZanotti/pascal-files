Program N3_ZANOTTI_03;
// Leonardo José Zanotti

uses n3_zanotti_biblioteca;

var nome: array[1..500] of string[30];
var espaco: array[1..500] of string[32];
var media: array[1..500] of real;
var i, a, b, c: integer;
var carStr, mediaTxt: string;
var carReal: real;
var key: boolean;

Begin
i:=0;
mediaTxt:='Escreva a média desse aluno: ';
repeat
	begin
		i:=i+1;
		write('Escreva o nome do aluno: ');
		readln(nome[i]);
		if (not(upcase(nome[i])='FIM')) then
			repeat
				media[i]:=leiaNum(mediaTxt);
			until (media[i]<=100) and (media[i]>=0);
		clrscr;
  end;
until (upcase(nome[i])='FIM') or (i=500);
i:=i-1;		// remove o 'fim' do array  

repeat
	begin
		key:=false;
		for a:=1 to i-1 do
			if (media[a]>media[a+1]) then
				begin                                   
					key:=true;
					carReal:=media[a];
					media[a]:=media[a+1];
					media[a+1]:=carReal;
					carStr:=nome[a];
					nome[a]:=nome[a+1];
					nome[a+1]:=carStr;
				end; 
	end;
until not(key);

for a:=1 to i do
	begin
		c:=32-length(nome[a]);
		for b:=1 to c do
			insert(' ', espaco[a], 1);
	end;
	
clrscr;
writeln('Aluno                           Media');
for a:=i downto 1 do
	writeln(nome[a], espaco[a], media[a]:3:2);	
End.