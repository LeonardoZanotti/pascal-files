Program N2_ZANOTTI_09;
// Leonardo Jos� Zanotti

uses n2_zanotti_biblioteca;

Begin
c:=7;
separaNumero(c);	
	
	write('Esse n�mero ao contr�rio �: ');
	for e:=7 downto 1 do
		write(digito[e]);
	readln();
End.