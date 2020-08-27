Program N2_ZANOTTI_06;
// Leonardo José Zanotti

uses n2_zanotti_biblioteca;

var base2: array[1..15] of integer;
var f: integer;

Begin
a:=readb10();
f:=a;

if (key) then
	begin	
	for b:=15 downto 1 do		
		begin
			base2[b]:=(a)mod(2);
			a:=(a)div(2);		  
	  end;
	  
	writeln('');
	write(f, ' na base 2 é: ');
	for b:=1 to 15 do
		write(base2[b]);
	end;

readln();
End.