require

class Application
  def initialize
    @show = Show.new
  end

    def perform
      # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
      # 
      puts "Bienvenue dans le jeu du Morpion !"

      puts "Joueur 1, entrez votre nom :"
      player1 = gets.chomp

      puts "Joueur 2, entrez votre nom :"
      player2 = gets.chomp
      
      player1 = Player.new("#{player1}","X")
      player2 = Player.new("#{player2}","O")

      board = Board.new

      @current_player = player1
      @current_player = player2

      @board = board
      @status = "on going"
      show = Show.new

      while @status == "on going"
        show.show_board(@board)
        @board.play_turn(@current_player)
        if @board.victory?
          @status = "victory"
          show.show_board(@board)
          puts "Félicitations ! #{@current_player}, vous avez gagné !"
        elsif @board.boardcases.none? { |casee| casee.value == " " }
          @status = "draw"
          show.show_board(@board)
          puts "Match nul !"
        else
          switch_player
        end

      end

    end

  end