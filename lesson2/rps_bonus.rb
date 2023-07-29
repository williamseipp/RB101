# rock beats scissors and lizard
# paper beats rock and spock
# scissors beats paper and lizard
# lizard beats paper and spock
# spock beats rock and scissors

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer, combinations)
  result = combinations[player][computer]
  prompt(result)
end

VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

combinations = {}
combinations["rock"] = {
  "rock" => "It's a tie",
  "paper" => "Computer won!",
  "scissors" => "You won!",
  "spock" => "Computer won!",
  "lizard" => "You won!"
}
combinations["paper"] = {
  "rock" => "You won!",
  "paper" => "It's a tie",
  "scissors" => "Computer won!",
  "spock" => "You won!",
  "lizard" => "Computer won!"
}
combinations["scissors"] = {
  "rock" => "Computer won!",
  "paper" => "You won!",
  "scissors" => "It's a tie",
  "spock" => "Computer won!",
  "lizard" => "You won!"
}
combinations["spock"] = {
  "rock" => "You won!",
  "paper" => "Computer won!",
  "scissors" => "You won!",
  "spock" => "It's a tie",
  "lizard" => "Computer won!"
}
combinations["lizard"] = {
  "rock" => "Computer won!",
  "paper" => "You won!",
  "scissors" => "Computer won!",
  "spock" => "You won!",
  "lizard" => "It's a tie"
}

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}
      \n Abbreviations are welcome ( e.g. [r]ock or [sp]ock ) ")
    choice = Kernel.gets().chomp()
    # compare choice to valid choices
    player_decision = VALID_CHOICES.select do |element|
      element.include?(choice)
    end

    if player_decision.length == 1
      choice = player_decision[0]
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; Computer chose #{computer_choice}")
  display_results(choice, computer_choice, combinations)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
