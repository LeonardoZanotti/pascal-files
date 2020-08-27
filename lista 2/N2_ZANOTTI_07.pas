Program N2_ZANOTTI_07;
// Leonardo José Zanotti

uses n2_zanotti_biblioteca;

var base2: array[0..14] of integer;
var c, d: integer;

Begin
a:=readb10();
d:=2;

if (key) then
	begin
	writeln('');
	write(a, ' na base 2 é: ');	
	for b:=14 downto 0 do		
		begin
			c:=potencia(d, b);
			if (c<=a) then	
				begin	
					base2[b]:=1;
	  		  a:=a-c;
				end
	  	else
	  		base2[b]:=0;
			write(base2[b]);	  
		end;
	end;
readln();   
End.