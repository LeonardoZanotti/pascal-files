Program NT2zanotti11;
// Leonardo José Zanotti

uses trabalho_zanotti_biblioteca;

Begin
	repeat
		begin
			separaNum();
			if (not(chave)) then
				extensoNum(centena, dezena, unidade);			
		end;		
	until (numero<1);  
End.