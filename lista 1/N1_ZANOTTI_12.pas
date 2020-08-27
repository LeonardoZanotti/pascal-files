Program N1_ZANOTTI_12;
// Leonardo José Zanotti

var num: array[1..10] of integer;
var n, i, soma: integer;

Begin
soma:=0;
for i:=1 to 10 do
	begin
		write('Escreva o ', i, '° número: ');
		readln(num[i]);
		soma:=soma+num[i];
	end;
	
writeln('Soma: ', soma);  
End.