class Show
  
  def show_board(board)
     #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
    puts " #{board.boardcases[0].value} | #{board.boardcases[1].value} | #{board.boardcases[2].value} "
    puts "---|---|---"
    puts " #{board.boardcases[3].value} | #{board.boardcases[4].value} | #{board.boardcases[5].value} "
    puts "---|---|---"
    puts " #{board.boardcases[6].value} | #{board.boardcases[7].value} | #{board.boardcases[8].value} "
  end

end