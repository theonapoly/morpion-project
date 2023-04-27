class Game
    #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
    attr_accessor :current_player, :status, :board, :player_list
  
    def initialize(player1, player2)
      #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
      @player_list = [player1, player2]
      @board = Board.new
      @status = "on going"
      @current_player = player_list.sample
    end
  
    def switch_player
      @current_player = (@current_player == @player_list[0]) ? @player_list[1] : @player_list[0]
    end

    def turn
      @board.display_board #l'instance de Board
      @board.play_turn(@current_player) #demande au joueur ce qu'il joue
      if @board.victory? #vérifie si un joueur a gagné
        @status = @current_player
      else
        @current_player = (@player_list - [@current_player])[0]
      end
    end

    def new_round
      # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
      @board = Board.new
      @status = "on going"
      @current_player = @players.first
      puts "Nouvelle partie !"
      sleep(1)
      turn
    end
  
    def game_end
      # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
      if @status == "draw"
        puts "Match nul !"
      else
        puts "Le joueur #{@status} a gagné !"
      end
    end
      
  
end
