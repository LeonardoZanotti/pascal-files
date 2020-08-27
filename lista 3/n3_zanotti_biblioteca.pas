unit n3_zanotti_biblioteca;
// Leonardo José Zanotti

interface
	// ---
	
  function validaData(dia, mes, ano: integer): boolean;

	// ---
	
	function potencia(var x, y: integer): integer;
	
	// ---
	
	function validaCPF(cpf: string[11]): boolean;
	
	// ---
	
	function leiaNum(texto: string): integer;
	
	// ---
	
implementation

//======================================================================================================================================================================

// Validador de datas
function validaData(dia, mes, ano: integer): boolean;
	var dmax: integer;
	var key: boolean;
	
	Begin             
		key:=true;
		
		// ajustar essa parte dependendo do que se precisa
		if (ano<1940) or (ano>2006) then
			key:=false
		else if (mes<1) or (mes>12) then
				key:=false
		else
			begin
				dmax:=31;
				if (mes=4) or (mes=6) or (mes=9) or (mes=11) then
					dmax:=30;
					if (mes=2) then
						dmax:=28;
						if ((ano)mod(4)=0) then
							dmax:=29;
			end;
		if (dia<1) or (dia>dmax) then
			key:=false;
			
		validaData:=key;
	end;

//======================================================================================================================================================================

// Calcula um número elevado a outro
function potencia(var x, y: integer): integer;
	var w, z: integer;
	begin
		w:=1;
		for z:=1 to y do
			w:=w*x;
		potencia:=w;
	end;

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

// lê e valida um número como integer
function leiaNum(texto: string): integer;
	var numStr: string;
	var a, i: integer;
	begin
		repeat	
			write(texto);
			readln(numStr);
			
			val(numStr, i, a);
		until (a=0);
		
		leiaNum:=i;
	end;

//======================================================================================================================================================================

  
End.