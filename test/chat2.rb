# class BoardCase
#     attr_accessor :value, :id
  
#     def initialize(id)
#       @value = " "
#       @id = id
#     end
#   end
  ----------------------------------------------------------------------
#   class Board
#     attr_accessor :cases
  
#     def initialize
#       @cases = []
#       (1..9).each { |id| @cases << BoardCase.new(id) }
#     end
  
#     def play_turn(player)
#       puts "Joueur #{player.name}, choisissez une case (1 à 9) :"
#       choice = gets.chomp.to_i
  
#       while !valid_choice?(choice)
#         puts "Case déjà occupée ou choix invalide. Choisissez une autre case :"
#         choice = gets.chomp.to_i
#       end
  
#       cases[choice - 1].value = player.value
#     end
  
#     def victory?
#       # Check lines
#       (0..8).step(3).each do |i|
#         return true if cases[i].value != " " && cases[i].value == cases[i+1].value && cases[i+1].value == cases[i+2].value
#       end
  
#       # Check columns
#       (0..2).each do |i|
#         return true if cases[i].value != " " && cases[i].value == cases[i+3].value && cases[i+3].value == cases[i+6].value
#       end
  
#       # Check diagonals
#       return true if cases[0].value != " " && cases[0].value == cases[4].value && cases[4].value == cases[8].value
#       return true if cases[2].value != " " && cases[2].value == cases[4].value && cases[4].value == cases[6].value
  
#       # No winner yet
#       return false
#     end
  
#     def valid_choice?(choice)
#       return false if choice < 1 || choice > 9
#       return cases[choice - 1].value == " "
#     end
  
#     def to_s
#       " #{cases[0].value} | #{cases[1].value} | #{cases[2].value} \n---|---|---\n #{cases[3].value} | #{cases[4].value} | #{cases[5].value} \n---|---|---\n #{cases[6].value} | #{cases[7].value} | #{cases[8].value} "
#     end
#   end
  -------------------------------------------------------------------------------------
#   class Player
#     attr_reader :name, :value
  
#     def initialize(name, value)
#       @name = name
#       @value = value
#     end
#   end
    ------------------------------------------------------------------------------------
  class Game
    attr_accessor :current_player, :status, :board, :players
  
    def initialize
      @board = Board.new
      @players = [Player.new("Joueur 1", "X"), Player.new("Joueur 2", "O")]
      @current_player = players[0]
      @status = "en cours"
    end
  
    def turn
      system "clear" or system "cls"
      puts board.to_s
      board.play_turn(current_player)
  
      if board.victory?
        self.status = current_player
      elsif board.cases.all? { |cell| cell.value != " " }
        self.status = "match nul"
      else
        switch_player
      end
    end
  
    def switch_player
      self.current_player = (current_player == players[0]) ? players[1] : players[0]
    end
  
    def new
  
  
  

  class BoardCase
    attr_accessor :value, :id
  
    def initialize(id)
      @value = " "
      @id = id
    end
  end
  
  class Board
    attr_accessor :cases, :count_turn
  
    def initialize
      @cases = {}
      (1..9).each { |id| @cases[id] = BoardCase.new(id) }
      @count_turn = 0
    end
  
    def play_turn(player)
      puts "#{player.name}, c'est à toi de jouer. Choisis une case entre 1 et 9 :"
      choice = gets.chomp.to_i
      until (1..9).include?(choice) && @cases[choice].value == " "
        puts "Mauvais choix, choisis une case libre entre 1 et 9 :"
        choice = gets.chomp.to_i
      end
      @cases[choice].value = player.value
      @count_turn += 1
    end
  
    def victory?
      win_combinations = [
        [1, 2, 3], [4, 5, 6], [7, 8, 9], # lignes
        [1, 4, 7], [2, 5, 8], [3, 6, 9], # colonnes
        [1, 5, 9], [3, 5, 7] # diagonales
      ]
      win_combinations.any? do |combo|
        combo.map { |id| @cases[id].value }.uniq.count == 1 && @cases[combo[0]].value != " "
      end
    end
  
    def display_board
      puts "\n"
      puts " #{@cases[1].value} | #{@cases[2].value} | #{@cases[3].value} "
      puts "---|---|---"
      puts " #{@cases[4].value} | #{@cases[5].value} | #{@cases[6].value} "
      puts "---|---|---"
      puts " #{@cases[7].value} | #{@cases[8].value} | #{@cases[9].value} "
      puts "\n"
    end
  end
  
  class Player
    attr_reader :name, :value
  
    def initialize(name, value)
      @name = name
      @value = value
    end
  end
  
  class Game
    attr_accessor :current_player, :status, :board, :players
  
    def initialize
      @player1 = Player.new("Joueur 1", "X")
      @player2 = Player.new("Joueur 2", "O")
      @players = [@player1, @player2]
      @board = Board.new
      @status = "on going"
      @current_player = @players.sample
    end
  
    def turn
      @board.display_board
      @board.play_turn(@current_player)
      if @board.victory?
        @status = @current_player
      elsif @board.count_turn == 9
        @status = "draw"
      else
        @current_player = (@players - [@current_player])[0]
      end
    end
  
    def new_round
      @board = Board.new
      @status = "on going"
      @current_player = @players.sample
      puts "Nouvelle partie !"
      sleep(1)
      turn
    end
  
    def game_end
      case @status
      when "draw"
        puts "Match nul !