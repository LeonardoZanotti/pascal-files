unit zanotti_biblioteca;
// Leonardo José Zanotti

interface
	
	// ---
	
	function validaCPF(cpf: string[11]): boolean;
	
	// ---
	
implementation

//======================================================================================================================================================================

// Validador de CPFs
function validaCPF(cpf: string[11]): boolean;
	var teste1, teste2, resto1, soma, i, a, calc: integer;
	var digito: array[1..11] of integer;
	var key: boolean;
	var cpfStr: string;
	
	Begin
		key:=true;
		
		for i:=1 to 11 do
			begin
				val(cpf[i], digito[i], a);				
				if (a>0) then
					key:=false;
			end;
			
		// Teste do primeiro dígito
		a:=1;
		for i:=10 downto 2 do
			begin				
				soma:=soma+digito[a]*i;
				a:=a+1;
			end;
		teste1:=soma*10;
		resto1:=teste1 mod 11;
		
		if (resto1=10) then
			teste2:=0
		else
			teste2:=resto1;
			
		if (digito[10]<>teste2) or (not(key)) then
			key:=false;
			
		// Teste do segundo dígito
		if (key) then
			begin
				soma:=0;
				a:=1;				
				for i:=11 downto 2 do
					begin				
						soma:=soma+digito[a]*i;
						a:=a+1;
					end;
				teste1:=soma*10;
				resto1:=teste1 mod 11;
				
				if (resto1=10) then
					teste2:=0
				else
					teste2:=resto1;
				
				if (digito[11]<>teste2) then
					key:=not(key);
				
				// Anulando CPFs com todos os números iguais: 11111111111, 22222222222
				for i:=1 to 11 do
					if (digito[1]=digito[i]) then
						calc:=calc+1;
				if (calc=11) then
					key:=false;
			end;
		writeln();
		validaCPF:=key;	
	end;

//======================================================================================================================================================================
  
End.