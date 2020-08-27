Program N2_ZANOTTI_06E07_DECODE;
// Leonardo Jos� Zanotti

uses n2_zanotti_biblioteca;

var base2: string[15]; 
var i, a, b, c, base10: integer;
var key: boolean;

Begin
write('Escreva um n�mero na base 2 com at� 15 d�gitos: ');
readln(base2);

b:=length(base2)-1;
i:=2;
a:=potencia(i, b);
base10:=0;
key:=true;

for i:=1 to b+1 do
	begin
		if (base2[i]<>'1') and (base2[i]<>'0') then
			begin
				key:=false;
				i:=b+1;
				writeln('Escreva um n�mero em bin�rio!!');
			end;
		if (base2[i]='1') then
				base10:=base10+a;
		a:=a div 2;				
	end;

if (key) then	
	writeln(base2, ' na base 10 �: ', base10);
	
readln();  
End.