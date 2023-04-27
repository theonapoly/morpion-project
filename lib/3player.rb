require 'pry'

class Player
    #TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).
    attr_reader :name, :mark
    
    def initialize(name, mark)
      #TO DO : doit régler son nom et sa valeur
      @name = name.to_s
      @mark = mark.to_s.upcase
    end
    
end


    binding.pry