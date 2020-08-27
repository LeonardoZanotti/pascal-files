Program N1_ZANOTTI_27;
// Leonardo José Zanotti

var a, n, i: integer;

Begin
i:=0;

writeln('Quantos termos da sequência você quer ver?');
readln(n);
clrscr;

writeln('Mostrando os ', n, ' primeiros termos da sequência');
for a:=1 to n do
	begin
	i:=i+a;
	writeln(i);
	end;
readln();                                                          
End.