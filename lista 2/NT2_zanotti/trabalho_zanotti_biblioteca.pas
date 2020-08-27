unit trabalho_zanotti_biblioteca;
// Leonardo José Zanotti  
  	 
interface
  
  // --- JOGO DO PALITO --- //
  
  procedure giraPalito();
  procedure menuInicial();
	function gameStart(): boolean;
  procedure apostaPalitoB(botP: integer; var palitosB: integer);
  procedure apostaPalitoP(botP, playerP: integer; var palitosP: integer);
  function chutaPalitosB(botP, playerP, apostaP, palitosB: integer): integer;
  function chutaPalitosP(botP, playerP, apostaB, palitosP: integer): integer;
  procedure mostraPalitos(palitosP, palitosB, apostaP, apostaB: integer);
	procedure verificaChutes(chutaPalitosP, chutaPalitosB, palitosP, palitosB: integer; var i, botP, playerP: integer; var vencedorRodada: string; var vezdequem: boolean);
  
  // --- JOGO DO PALITO --- //
  
	
	// --- Exercício 13 --- //
	
	type extenso = array[0..9] of string;
	var centExtenso, dezExtenso, uniExtenso, especialExtenso: extenso;
	var numero, centena, dezena, unidade, resto: integer;
	var chave: boolean;
	var centenaExtenso, dezenaExtenso, unidadeExtenso: string;
	procedure separaNum();
	procedure extensoNum(cen, dez, uni: integer);
	
	// --- Exercício 13 --- // 
  
implementation
	
//======================================================================================================================================================================
// --- JOGO DO PALITO --- //
//======================================================================================================================================================================

// Animação de palito girando
procedure giraPalito();
	var k: integer;
	begin
		k:=0;
		repeat
	  	begin
	  		// 1
				delay(100);
				gotoxy(1,1);  
				writeln('/');
				
				delay(100);
				gotoxy(1,1);   
				writeln('-');
				
				delay(100);
				gotoxy(1,1);   
				writeln('\');
				
				delay(100);
				gotoxy(1,1);   
				writeln('|');
				
				// 2
				delay(100);
				gotoxy(18,1);  
				writeln('/');
				
				delay(100);
				gotoxy(18,1);   
				writeln('-');
				
				delay(100);
				gotoxy(18,1);   
				writeln('\');
				
				delay(100);
				gotoxy(18,1);   
				writeln('|');
				
				// 3
				delay(100);
				gotoxy(1,5);  
				writeln('/');
				
				delay(100);
				gotoxy(1,5);   
				writeln('-');
				
				delay(100);
				gotoxy(1,5);   
				writeln('\');
				
				delay(100);
				gotoxy(1,5);   
				writeln('|');
				
				// 4
				delay(100);
				gotoxy(18,5);  
				writeln('/');
				
				delay(100);
				gotoxy(18,5);   
				writeln('-');
				
				delay(100);
				gotoxy(18,5);   
				writeln('\');
				
				delay(100);
				gotoxy(18,5);   
				writeln('|');
				
				// 5
				delay(100);
				gotoxy(1,7);  
				writeln('/');
				
				delay(100);
				gotoxy(1,7);   
				writeln('-');
				
				delay(100);
				gotoxy(1,7);   
				writeln('\');
				
				delay(100);
				gotoxy(1,7);   
				writeln('|');
				
				// 6
				delay(100);
				gotoxy(29,7);  
				writeln('/');
				
				delay(100);
				gotoxy(29,7);   
				writeln('-');
				
				delay(100);
				gotoxy(29,7);   
				writeln('\');
				
				delay(100);
				gotoxy(29,7);   
				writeln('|');
				
				k:=k+1;
				gotoxy(3, 7);
				writeln('   O JOGO COMEÇA EM: ', 5-k);
			end;
  	until (k=5);
	end;

//======================================================================================================================================================================

// Menu inicial do jogo do palito
procedure menuInicial();
	begin
		writeln(' ================ ');
		writeln('|                |');
		writeln('| JOGO DO PALITO |');
		writeln('|                |');
		writeln(' ================ ');
		writeln();
	end;

//======================================================================================================================================================================

// Retorna true ou false para determinar se quem inicia o jogo é o bot ou o jogador
function gameStart(): boolean;
	begin
		if (random(2)=1) then
			gameStart:=false
		else
			gameStart:=true;
	end;

//======================================================================================================================================================================
  
// Inverte a vez do jogador e aposta os palitos do bot
procedure apostaPalitoB(botP: integer; var palitosB: integer);
	begin
		palitosB:=random(botP+1);			
	end;
	
//======================================================================================================================================================================

// Inverte a vez do jogador e pergunta quantos palitos o jogador quer apostar
procedure apostaPalitoP(botP, playerP: integer; var palitosP: integer);
	begin	
		repeat
			begin
				clrscr;
				writeln('Bot - ', botP, ' x ', playerP, ' - Player');
			
			
				writeln('Quantos palitos quer apostar?');
				readln(palitosP);
			end;				
		until (palitosP<=playerP) and (palitosP>=0);
	end;
	
//======================================================================================================================================================================

// calcula quantos palitos o bot acha que tem no jogo
function chutaPalitosB(botP, playerP, apostaP, palitosB: integer): integer;
	var chuteBot: integer;
	begin
		repeat
			begin
				// chute para quando o jogador chuta 0
				if ((apostaP=0) and (palitosB<>0)) then
					chuteBot:=palitosB 
				
				// chute para quando o jogador chuta o máximo de palitos
				else if ((apostaP=(botP+playerP)) and (palitosB<>botP)) then
					chuteBot:=palitosB+playerP
				
				// chute pra quando o jogador chuta 5
				else if (apostaP=5) then
					chuteBot:=palitosB+2+random(2)	
					
				// chute pra quando o jogador chuta 4
				else if (apostaP=4) then
					begin
						if (botP+playerP=6) then 	// 3 e 3 palitos
							chuteBot:=palitosB+1+random(3)
						else											// 3 e 2 palitos
							begin
								if (botP=3) then 		// bot com 3
									chuteBot:=palitosB+1+random(2)
								else                // bot com 2 
									chuteBot:=palitosB+2+random(2);
							end;	
					end
				
				// chute pra quando o jogador chuta 3
				else if (apostaP=3) then
					begin
						if (botP+playerP=5) then	// 2 e 3 palitos
							begin
								if (botP=3) then		// bot com 3
							  	chuteBot:=palitosB+random(playerP+1)
								else       					// bot com 2
									chuteBot:=palitosB+1+random(3);
							end
						else if (botP+playerP=4) then		// 2 e 2 ou 3 e 1 palitos
							begin
								if (botP=3) then		// bot com 3
									chuteBot:=palitosB+random(playerP+1)		
								else if (botP=1) then		// bot com 1
									chuteBot:=palitosB+2+random(2)
								else				// bot com 2
									chuteBot:=palitosB+1+random(2)	
							end
						else		// 3 e 3 palitos
							chuteBot:=palitosB+random(playerP+1);	
					end
				
				// chute pra quando o jogador chuta 2
				else if (apostaP=2) then
					begin					
						if (botP+playerP=4) then	// 3 e 1 apenas
							begin
								if (botP=3) then	// bot com 3
							  	chuteBot:=palitosB+random(2)
								else              // bot com 1
							    chuteBot:=palitosB+1+random(2);
							end
						else if (botP+playerP=3) then // 2 e 1
							begin
								if (botP=2) then   // bot com 2
							  	chuteBot:=palitosB+random(2)
								else               // bot com 1
							    chuteBot:=palitosB+1+random(2)
							end
						else 		// botP+playerP = 4 (2 e 2), 5 ou 6
							chuteBot:=palitosB+random(3);
					end
						
				// chute pra quando o jogador chuta 1
				else if (apostaP=1) then
					chuteBot:=palitosB+random(2)	
				
				// chute pra quando o jogador chuta algo diferente do escrito
				else
					chuteBot:=palitosB+random(playerP+1);	
			
			end;
		until(chuteBot<>apostaP);
		chutaPalitosB:=chuteBot;
	end;
	
//======================================================================================================================================================================

// pergunta quantos palitos o jogador acha que tem no jogo
function chutaPalitosP(botP, playerP, apostaB, palitosP: integer): integer;
	var chutePlayer: integer;
	begin
		repeat
			begin
				clrscr;
				writeln('Bot - ', botP, ' x ', playerP, ' - Player');
				writeln();
				if (apostaB<>-1) then
					begin
						writeln('A aposta do bot foi: ', apostaB);
						writeln();
					end;
				writeln('Qual a sua aposta?');
				readln(chutePlayer);
			end;
		until ((chutePlayer<>apostaB) and (chutePlayer>=palitosP) and (chutePlayer<=(botP+palitosP)));
		chutaPalitosP:=chutePlayer;
	end;

//======================================================================================================================================================================

// Mostra quantos palitos o bot e o player escolheram e suas apostas
procedure mostraPalitos(palitosP, palitosB, apostaP, apostaB: integer);
	begin
		clrscr;
		writeln('Você colocou ', palitosP, ' palitos e apostou que ', apostaP, ' palitos estavam em jogo');
		writeln('O bot colocou ', palitosB, ' palitos e apostou que ', apostaB, ' palitos estavam em jogo');
		writeln('Total de palitos em jogo: ', palitosP+palitosB);
		writeln();
	end;
  
//======================================================================================================================================================================

// Verifica se alguém acertou os chutes e calcula a nova pontuação
procedure verificaChutes(chutaPalitosP, chutaPalitosB, palitosP, palitosB: integer; var i, botP, playerP: integer; var vencedorRodada: string; var vezdequem: boolean);
	var total: integer;
	begin
		total:=palitosP+palitosB;
	  if (chutaPalitosP=total) then
	  	begin
				playerP:=playerP-1;
		  	vencedorRodada:='Você acertou essa rodada!';
			end
		else if (chutaPalitosB=total) then
			begin
				botP:=botP-1;
				vencedorRodada:='O bot acertou essa rodada!';
			end
		else
			vencedorRodada:='Ninguém acertou essa rodada!';
		
		
		writeln('Fim da rodada ', i);
		writeln(vencedorRodada);
		writeln('Bot - ', botP, ' x ', playerP, ' - Player');
		vezdequem:=not(vezdequem);
		i:=i+1;
		readln();
	end;

//======================================================================================================================================================================
// --- JOGO DO PALITO --- //
//======================================================================================================================================================================

//======================================================================================================================================================================
// --- Exerccício 13 --- //
//======================================================================================================================================================================

// Lê e separa os dígitos de um número maior que 0 e menor que 1000
procedure separaNum();
	begin
		chave:=false;
		repeat
			begin
				write('Escreva um número entre 0 e 1000: ');
				readln(numero);
			end;
		until (numero<1000);
		
		if (numero>0) then
			begin
				centena:=numero div 100;
				resto:=numero mod 100;
				dezena:=resto div 10;
				unidade:=resto mod 10;
			end
		else
			chave:=true;			
	end;

//======================================================================================================================================================================

// Mostra o extenso de um número de até 3 dígitos;
procedure extensoNum(cen, dez, uni: integer);
	begin
		// centenas
		centExtenso[0]:=chr(0);
		centExtenso[1]:='cento';
		centExtenso[2]:='duzentos';
		centExtenso[3]:='trezentos';
		centExtenso[4]:='quatrocentos';
		centExtenso[5]:='quinhentos';
		centExtenso[6]:='seiscentos';
		centExtenso[7]:='setecentos';
		centExtenso[8]:='oitocentos';
		centExtenso[9]:='novecentos';
		
		// dezenas
		dezExtenso[0]:=chr(0);
		dezExtenso[1]:='dez';
		dezExtenso[2]:='vinte';
		dezExtenso[3]:='trinta';
		dezExtenso[4]:='quarenta';
		dezExtenso[5]:='cinquenta';
		dezExtenso[6]:='sessenta';
		dezExtenso[7]:='setenta';
		dezExtenso[8]:='oitenta';
		dezExtenso[9]:='noventa';
		
		// unidades		
		uniExtenso[0]:=chr(0);
		uniExtenso[1]:='um';
		uniExtenso[2]:='dois';
		uniExtenso[3]:='três';
		uniExtenso[4]:='quatro';
		uniExtenso[5]:='cinco';
		uniExtenso[6]:='seis';
		uniExtenso[7]:='sete';
		uniExtenso[8]:='oito';
		uniExtenso[9]:='nove';
		
		// para dezena = 1 e unidades de 1 a 9
		especialExtenso[1]:='onze';
		especialExtenso[2]:='doze';
		especialExtenso[3]:='treze';
		especialExtenso[4]:='quatorze';
		especialExtenso[5]:='quinze';
		especialExtenso[6]:='dezesseis';
		especialExtenso[7]:='dezessete';
		especialExtenso[8]:='dezoito';
		especialExtenso[9]:='dezenove';
		
		centenaExtenso:=centExtenso[cen];
		dezenaExtenso:=dezExtenso[dez];
		unidadeExtenso:=uniExtenso[uni];		
		
		if (cen=1) and (dez=0) and (uni=0) then
			centenaExtenso:='cem'
		else if (dez=1) and (uni<>0) then
			begin				
				unidadeExtenso:=chr(0);
				dezenaExtenso:=especialExtenso[uni];										 	
			end;		                            		
		
		write(centenaExtenso);
		if ((centenaExtenso<>chr(0)) and ((dezenaExtenso<>chr(0)) or (unidadeExtenso<>chr(0)))) then
			write(' e ');
		write(dezenaExtenso);
		if ((dezenaExtenso<>chr(0)) and (unidadeExtenso<>chr(0))) then
			write(' e ');
		write(unidadeExtenso);
		writeln();					
	end;

//======================================================================================================================================================================
// --- Exerccício 13 --- //
//======================================================================================================================================================================

End.