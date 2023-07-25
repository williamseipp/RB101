# rock beats scissors and lizard
# paper beats rock and spock
# scissors beats paper and lizard
# lizard beats paper and spock
# spock beats rock and scissors
VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def outcome(player, computer)
  combinations = {}
  combinations["rock"] = {
    "rock" => "It's a tie",
    "paper" => "Computer won!",
    "scissors" => "You won!"
  }
  combinations["paper"] = {
    "rock" => "You won!",
    "paper" => "It's a tie",
    "scissors" => "Computer won!"
  }
  combinations["scissors"] = {
    "rock" => "Computer won!",
    "paper" => "You won!",
    "scissors" => "It's a tie"
  }
  combinations[player][computer]
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; Computer chose #{computer_choice}")
  outcome = outcome(choice, computer_choice)
  prompt(outcome)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
