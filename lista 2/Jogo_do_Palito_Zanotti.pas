Program Jogo_do_Palito_Zanotti;
// Leonardo José Zanotti

uses n2_zanotti_biblioteca;

var a, bot, player, palitosBot, palitosPlayer, apostaBot, apostaPlayer: integer;
var vez, gameover: boolean;
var vencedor, rodada: string;

Begin
bot:=3;
player:=3;
gameover:=false;
a:=1;

// Menu inicial do jogo
menuInicial();
giraPalito();
clrscr;			
// -------------------

vez:=gameStart();		// determina aleatoriamente quem começa jogando
	
repeat
	begin
		apostaBot:=-1;
		apostaPlayer:=-1;
		
		if (vez) then  	// vez do jogador
			begin
			  apostaPalitoP(bot, player, palitosPlayer);
				apostaPalitoB(bot, palitosBot);
			  apostaPlayer:=chutaPalitosP(bot, player, apostaBot, palitosPlayer);
			  apostaBot:=chutaPalitosB(bot, player, apostaPlayer, palitosBot);
			  mostraPalitos(palitosPlayer, palitosBot, apostaPlayer, apostaBot);
				verificaChutes(apostaPlayer, apostaBot, palitosPlayer, palitosBot, a, bot, player, rodada, vez);
			end
		else    			  // vez do bot
			begin
				apostaPalitoB(bot, palitosBot);
			  apostaPalitoP(bot, player, palitosPlayer);
			  apostaBot:=chutaPalitosB(bot, player, apostaPlayer, palitosBot);
			  apostaPlayer:=chutaPalitosP(bot, player, apostaBot, palitosPlayer);
			  mostraPalitos(palitosPlayer, palitosBot, apostaPlayer, apostaBot);
			  verificaChutes(apostaPlayer, apostaBot, palitosPlayer, palitosBot, a, bot, player, rodada, vez);	   				
			end;
		
		if (bot=0) then 		// verifica se alguém venceu
			begin
				vencedor:='O bot';
				gameover:=true;
			end
		else if (player=0) then
			begin
				vencedor:='Você';
				gameover:=true;
			end;
	end;
until (gameover);			// até o jogo acabar  

// tela de fim de game
clrscr;
writeln('FIM DE JOGO');
writeln(vencedor, ' foi o vencedor!');
writeln('Palitos do bot: ', bot);
writeln('Palitos do jogador: ', player);
readln();
End.