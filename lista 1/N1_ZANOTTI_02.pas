Program N1_ZANOTTI_02;
// Leonardo Jos� Zanotti

var product, region: string;
var price: real;
var i, origem: integer; 

Begin
i:=0;
	while (i=0) do
		begin
			writeln('Nome do produto: ');
			readln(product);
			writeln('');
			
			writeln('Pre�o: ');
			readln(price);
			writeln('');
			
			writeln('C�digo de origem: ');
			readln(origem);
			writeln('');
			
			if (origem=1) then
				region:='Sul'
			else if (origem>1) and (origem<5) then
				region:='Norte'
			else if (origem>4) and (origem<10) then
				region:='Sudeste'
			else if (origem>9) and (origem<14) then
				region:='Nordeste'
			else if (origem>13) then
				region:='Outra regi�o'
			else
				region:='Importado';
				         		
			writeln('Nome: ', product, '; Pre�o: ', price:8:2, '; Origem: ', region,'.');
			writeln('');
			writeln('');
			readln()
		end;
End.