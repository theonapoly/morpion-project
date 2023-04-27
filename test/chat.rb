# class BoardCase
#     attr_accessor :value, :id
    
#     def initialize(id)
#       @value = " "
#       @id = id
#     end
#   end
  --------------------------------------------------------------------------------------
  # class Board
  #   attr_accessor :boardcases
    
  #   def initialize
  #     @boardcases = []
  #     (1..9).each { |i| @boardcases << BoardCase.new(i) }
  #   end
    
  #   def display_board
  #     puts "+---+---+---+"
  #     puts "| #{@boardcases[0].value} | #{@boardcases[1].value} | #{@boardcases[2].value} |"
  #     puts "+---+---+---+"
  #     puts "| #{@boardcases[3].value} | #{@boardcases[4].value} | #{@boardcases[5].value} |"
  #     puts "+---+---+---+"
  #     puts "| #{@boardcases[6].value} | #{@boardcases[7].value} | #{@boardcases[8].value} |"
  #     puts "+---+---+---+"
  #   end
    
  #   def play_turn(player)
  #     puts "Player #{player.name} (#{player.symbol}), choose a number between 1 and 9:"
  #     position = gets.chomp.to_i
  #     until (1..9).include?(position) && @boardcases[position - 1].value == " "
  #       puts "Invalid input, choose an available position:"
  #       position = gets.chomp.to_i
  #     end
  #     @boardcases[position - 1].value = player.symbol
  #   end
    
  #   def victory?
  #     winning_combinations = [[0,1,2],[3,4,5],[6,7,8],
  #                             [0,3,6],[1,4,7],[2,5,8],
  #                             [0,4,8],[2,4,6]]
  #     winning_combinations.each do |combo|
  #       if @boardcases[combo[0]].value == @boardcases[combo[1]].value && @boardcases[combo[1]].value == @boardcases[combo[2]].value && @boardcases[combo[0]].value != " "
  #         return true
  #       end
  #     end
  #     return false
  #   end
  # end
  ------------------------------------------------------------------------------
  # class Player
  #   attr_reader :name, :symbol
    
  #   def initialize(name, symbol)
  #     @name = name
  #     @symbol = symbol
  #   end
  # end
  ----------------------------------------------------------------------------------
  class Game
    attr_accessor :current_player, :status, :board, :players
    
  #   def initialize(player1, player2)
  #     @players = [player1, player2]
  #     @board = Board.new
  #     @current_player = player1
  #     @status = "on going"
  #   end
    
    def switch_player
      @current_player = (@current_player == @players[0]) ? @players[1] : @players[0]
    end
    
    def new_round
      @board = Board.new
      @status = "on going"
    end
    
    def game_end
      if @board.victory?
        puts "Congratulations, #{current_player.name} (#{current_player.symbol}) wins!"
        @status = current_player
      else
        puts "It's a tie!"
        @status = "tie"
      end
    end
    
 
    def play
        while @status == "on going"
          @board.display_board
          @board.play_turn(@current_player)
          if @board.victory?
            game_end
          elsif @board.boardcases.none? { |casee| casee.value == " " }
            game_end
          else
            switch_player
          end
        end
      end
      
      def switch_player
        if @current_player == @player1
          @current_player = @player2
        else
          @current_player = @player1
        end
      end
      
      def game_end
        @board.display_board
        if @board.victory?
          puts "#{@current_player.name} won the game !"
        else
          puts "It's a draw !"
        end
        @status = "finished"
      end
---------------------------------------------------------------------------------------
      class Application
        
        def perform
          puts "Bienvenue dans le jeu du Morpion !"
          puts "Joueur 1, entrez votre nom :"
          player1_name = gets.chomp
          puts "Joueur 2, entrez votre nom :"
          player2_name = gets.chomp
          player1 = Player.new(player1_name, "x")
          player2 = Player.new(player2_name, "o")
          board = Board.new
          @current_player = player1
          @other_player = player2
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
      