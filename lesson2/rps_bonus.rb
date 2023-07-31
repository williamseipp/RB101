require 'pry'
# Q: how to keep score?
#   a: play a round
#   b: determine winner
#   c: record who wins in a tally
#
# Q: what part of my code "plays a round" and how does it work?
# A: the main loop of the program;
#    1. i am prompted to enter a choice and do so
#    2. computer's choice is picked at random
#    3. choices and all possible combinations of choices are input
#       to a display_results which displays them
#
# I need to define a 'score' that increments appropriately when
# a winner is chosen
#
#
#

def prompt(message)
  Kernel.puts("=> #{message}")
end

def determine_winner(player, computer, combinations)
  combinations[player][computer]
end

def display_results(winner)
  prompt(winner)
end

def update_score(winner, score)
  if winner == 'player'
    score['player'] += 1
  elsif winner == 'computer'
    score['computer'] += 1
  end
end

VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

# combinations has the winner of rochambeau for every combination possible
combinations = {}
combinations["rock"] = {
  "rock" => "tie",
  "paper" => "computer",
  "scissors" => "player",
  "spock" => "computer",
  "lizard" => "player"
}
combinations["paper"] = {
  "rock" => "player",
  "paper" => "tie",
  "scissors" => "computer",
  "spock" => "player",
  "lizard" => "computer"
}
combinations["scissors"] = {
  "rock" => "computer",
  "paper" => "player",
  "scissors" => "tie",
  "spock" => "computer",
  "lizard" => "player"
}
combinations["spock"] = {
  "rock" => "player",
  "paper" => "computer",
  "scissors" => "player",
  "spock" => "tie",
  "lizard" => "computer"
}
combinations["lizard"] = {
  "rock" => "computer",
  "paper" => "player",
  "scissors" => "computer",
  "spock" => "player",
  "lizard" => "tie"
}

player_score = 0
computer_score = 0
score = { 'player' => 0, 'computer' => 0 }

loop do
  choice = ''

  loop do
    # player chooses
    prompt("Choose one: #{VALID_CHOICES.join(', ')}
      \n Abbreviations are welcome ( e.g. [r]ock or [sp]ock ) ")
    choice = Kernel.gets().chomp()
    VALID_CHOICES.select
    player_decision = VALID_CHOICES.select do |element|
      element.start_with?(choice)
    end

    if player_decision.length == 1
      choice = player_decision[0]
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  # computer chooses
  computer_choice = VALID_CHOICES.sample

  # review choices of each player
  prompt("You chose #{choice}; Computer chose #{computer_choice}")

  # winner is determined
  winner = determine_winner(choice, computer_choice, combinations)

  # results are displayed
  display_results(winner)

  # score is updated
  update_score(winner, score)

  # score is displayed
  puts "The score is player: #{score['player']} to computer: #{score['computer']}"

  # if someone has reached 3 points, game is over
  if score['player'] == 3 || score['computer'] == 3
    puts "#{winner} has won 3 games! #{winner} is the grand winner!"
    sleep(2)
    break
  else
    # otherwise, ask to continue playing
    puts "lets play to 3!"
    prompt("Do you want to play again?")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
  end
end

prompt("Thank you for playing. Good bye!")
