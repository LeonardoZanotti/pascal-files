Program N2_ZANOTTI_10;
// Leonardo Jos� Zanotti

uses n2_zanotti_biblioteca;

var soma, resto, dvc: integer;

Begin
c:=8;
separaNumero(c);

e:=9;
soma:=0;
for d:=1 to 7 do
	begin
		soma:=soma+digito[d]*(e-d);
	end;

resto:=soma mod 11;
dvc:=11-resto;
if (dvc=11) or (dvc=10) then
	dvc:=1;
	
if (dvc=digito[8]) then
	begin
		writeln('N�mero lido: ', j);	  
		writeln('D�gito Verificador Calculado: ', dvc);
		writeln('N�mero v�lido!');
	end
else
	begin
		writeln('N�mero lido: ', j);	  
		writeln('N�mero inv�lido!');
	end;

readln();
End.