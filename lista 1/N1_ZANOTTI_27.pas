Program N1_ZANOTTI_27;
// Leonardo Jos� Zanotti

var a, n, i: integer;

Begin
i:=0;

writeln('Quantos termos da sequ�ncia voc� quer ver?');
readln(n);
clrscr;

writeln('Mostrando os ', n, ' primeiros termos da sequ�ncia');
for a:=1 to n do
	begin
	i:=i+a;
	writeln(i);
	end;
readln();                                                          
End.