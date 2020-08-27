Program N3_ZANOTTI_02;
// Leonardo José Zanotti

var vetor: array[1..1000] of string[30];
var i, a: integer;
var car: string;
var key: boolean;

Begin
i:=0;
repeat
	begin
		i:=i+1;
		write('Escreva o ', i, '° nome: ');
		readln(vetor[i]);
  end;
until (upcase(vetor[i])='FIM') or (i=1000);
i:=i-1;		// remove o 'fim' do array  

repeat
	begin
		key:=false;
		for a:=1 to i-1 do
			if (upcase(vetor[a])>upcase(vetor[a+1])) then
				begin
					key:=true;
					car:=vetor[a];
					vetor[a]:=vetor[a+1];
					vetor[a+1]:=car;
				end; 
	end;
until not(key);

clrscr;
for a:=1 to i do
	writeln(vetor[a])	
End.