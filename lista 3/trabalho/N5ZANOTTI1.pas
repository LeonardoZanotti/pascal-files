Program N5ZANOTTI1;
// Leonardo José Zanotti

//ler num,nome,cpf,nasc, cargo e gerar um arq (SAI.TXT) para acesso seq.
//O REGISTRO SERÁ UM STRING DE 60 COM AS INFORMAÇÕES (CAMPOS) ABAIXO
//num max 9999 - 4 CARACTERES
//nome  - max  35 caracteres
//CPF - 11 CARACTERESS
//DATA NASCIMENTO (DD,MM,AA) - 8 CARACTERES
//cargo max 12 - 2 CARACTERES
//num=0, encerra

uses bibliotn;

 var ARQLOG:text;
     reg:string[60];
     a,b,num,TC,DD,MM,AA,CAR,E:integer;
     CPFR:REAL;
		 numa:string[4];
		 NOME:STRING[35];
		 CPF:STRING[11];
		 DI,ME:STRING[2];
		 AN:STRING[4];
		 CA:STRING[2];
		 CPFOK:BOOLEAN;     


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
	
Begin
 ASSIGN(ARQLOG,'SAI.SEQ');
 APPEND(ARQLOG);
 repeat
  leia1('numero',num);
 until(num<9999);
 while(num>0) do
  begin
   str(num,numa);
   TC:=LENGTH(NUMA);
   FOR A:=1 TO 4-TC DO
    INSERT('0',NUMA,1);
   WRITE('NOME=>');
   READLN(NOME);
   nome:=upcase(nome);
   TC:=LENGTH(NOME);
   FOR A:=TC+1 TO 35 DO
    INSERT(' ',NOME,A);
//VALIDAR O CPF
//REPEAT
     REPEAT
			 REPEAT //VERIFICA SE SOH NUMEROS NO STRING CPF
	      WRITE('CPF=>');
	      READLN(CPF);
	      VAL(CPF,CPFR,E);
	    UNTIL (E=0); //SE SAIR DO REPEAT EH PORQUE NO STRING CPF SOH TEM CARACTERES NUMERICOS
	   CPFOK:=ValidaCPF(CPF);  
    UNTIL (CPFOK);
//UNTIL VALCPF(CPF)

//fim
//VALIDA A DATA
   REPEAT
    LEIA1('DIA',DD);
    LEIA1('MES',MM);
    LEIA1('ANO',AA);
   UNTIL(VALIDATA(DD,MM,AA));
//fim
   STR(DD,DI);
   STR(MM,ME);
   STR(AA,AN);
   IF(DD<10)THEN
    INSERT('0',DI,1);
   IF(MM<10)THEN
    INSERT('0',ME,1);
//VALIDA O CARGO
   REPEAT
	  LEIA1('CARGO',CAR);
	 UNTIL (CAR>0) AND (CAR<13);
//fim
	 STR(CAR,CA);
	 IF(CAR<10)THEN
	  INSERT('0',CA,1);
//monta o registro strin[60]
	 INSERT(NUMA,REG,1);
	 INSERT(NOME,REG,5);
	 INSERT(CPF,REG,40);
	 INSERT(DI,REG,51);
	 INSERT(ME,REG,53);
	 INSERT(AN,REG,55);
	 INSERT(CA,REG,59);
//grava no arquivo
   WRITELN(ARQLOG,REG); 
   repeat
    leia1('numero',num);
   until(num<9999);
  end;
  CLOSE(ARQLOG);
End.