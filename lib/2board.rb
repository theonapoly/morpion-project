require 'pry'
require_relative "./1boardcase"


class Board
    #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
    #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
    attr_accessor :boardcases
  
  
    def initialize()
      #TO DO :
      #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
      #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
      @boardcases = []
      # for i in 0..8 do
      # boardcases[i] = BoardCase.new(i+1)
      (1..9).each {|id| @boardcases << BoardCase.new(id)}
    end
  

    def display_board
      puts "+---+---+---+"
      puts "| #{@boardcases[0].value} | #{@boardcases[1].value} | #{@boardcases[2].value} |"
      puts "+---+---+---+"
      puts "| #{@boardcases[3].value} | #{@boardcases[4].value} | #{@boardcases[5].value} |"
      puts "+---+---+---+"
      puts "| #{@boardcases[6].value} | #{@boardcases[7].value} | #{@boardcases[8].value} |"
      puts "+---+---+---+"
    end

    def play_turn
      #TO DO : une méthode qui :
      #1) demande au bon joueur ce qu'il souhaite faire
      #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
      puts "Le joueur #{player.name} - #{player.mark}, doit choisir un nombre entre 1 et 9:"
      choice = gets.chomp.to_i

      while !valid_choice?(choice)
      puts "Case déjà occupée ou choix invalide. Choisissez une autre case :"
      choice = gets.chomp.to_i
      end

      cases[choice - 1].value = player.value

    end
 
    def victory?
      #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
      (0..8).step(3).each do |i|
        return true if cases[i].value != " " && cases[i].value == cases[i+1].value && cases[i+1].value == cases[i+2].value
      end
  
      # Check columns
      (0..2).each do |i|
        return true if cases[i].value != " " && cases[i].value == cases[i+3].value && cases[i+3].value == cases[i+6].value
      end
  
      # Check diagonals
        return true if cases[0].value != " " && cases[0].value == cases[4].value && cases[4].value == cases[8].value
        return true if cases[2].value != " " && cases[2].value == cases[4].value && cases[4].value == cases[6].value
  
      # No winner yet
        return false
    end

    def valid_choice?(choice)

        return false if choice < 1 || choice > 9
        return cases[choice - 1].value == " "
    end
    
    def to_s
        " #{cases[0].value} | #{cases[1].value} | #{cases[2].value} \n---|---|---\n #{cases[3].value} | #{cases[4].value} | #{cases[5].value} \n---|---|---\n #{cases[6].value} | #{cases[7].value} | #{cases[8].value} "
    end

end
  

# binding.pry
