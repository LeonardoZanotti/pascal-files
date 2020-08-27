Program N2_ZANOTTI_13;
// Leonardo José Zanotti

uses n2_zanotti_biblioteca;

Begin
	repeat
		begin
			separaNum();
			if (not(chave)) then
				extensoNum(centena, dezena, unidade);			
		end;		
	until (numero<1);  
End.