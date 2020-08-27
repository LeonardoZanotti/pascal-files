Program N1_ZANOTTI_02;
// Leonardo José Zanotti

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
			
			writeln('Preço: ');
			readln(price);
			writeln('');
			
			writeln('Código de origem: ');
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
				region:='Outra região'
			else
				region:='Importado';
				         		
			writeln('Nome: ', product, '; Preço: ', price:8:2, '; Origem: ', region,'.');
			writeln('');
			writeln('');
			readln()
		end;
End.