# array = ["a","b","c","d"]
# index = 3
# array[index] = "z"
# puts array



#   (0..8).step(3).each do |i|
#     return true if cases[i].value != " " && cases[i].value == cases[i+1].value && cases[i+1].value == cases[i+2].value
#   end


alcool = ["vodka", "gin", "whisky"]
index = 3
alcool[index] = "tequila" 
alcool << "mezcal"
alcool.push("rhum")
alcool.each do |i| 
    puts "Je mettrai un peu de #{i} dans mon cocktail"
end