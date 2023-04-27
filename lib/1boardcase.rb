class BoardCase
    #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
    # Elle a pour but de représenter une case de la grille de jeu Morpion

    attr_accessor :value, :id #crée 2 attributs pour la classe BordCase, value et id
  
    def initialize(id)
      #TO DO : doit régler sa valeur, ainsi que son numéro de case
      @value = "" #valeur de la case, initalement vide, donc ""
      @id = id # initialise l'attribu "id"
    end   
end
  
  