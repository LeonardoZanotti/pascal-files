Program N_1C_prog_mod_ZANOTTI;
// Leonardo Jos� Zanotti

// 1 - DIV1, MULT, INT, INTEIRO, RESTO 
// 2 - P1, P2, N, X,, NUM, R
// 3 - NN, A, B, RES, MU, NMU
// 4 - NUM, 2, R, P1, P2, 3
// 5 - � necess�rio mudar o valor da vari�vel global para salver os m�ltiplos e n�o m�ltiplos do
// 		 n�mero testado, visto que a vari�vel local n�o � salva.
// 6 - FUP que leia 10 n�meros e mostre o total de n�meros lidos pares e �mpares; ap�s, leia mais 10 
//		 n�meros e mostre o total de n�meros lidos m�ltiplos de 3 e n�o m�ltiplos de 3.

uses biblioteca_zanotti;
var p1, p2, n, num, x, res: integer; 
  
Begin
	n:=1;
repeat
	n:=n+1;
	p1:=0;
	p2:=0;
	
	for x:=1 to 10 do
		begin
			write('Escreva o ', x, '� n�mero: ');
			readln(num);
			clrscr;
				res:=resto(num, n);		// biblioteca_zanotti
				test(res, p1, p2);    // biblioteca_zanotti
		end;
	exit(n, p1, p2);            // biblioteca_zanotti
until n=3;  
End.