require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('rps_messages.yml')

def explain_rules
  rule_line = 1

  loop do
    display_header()
    prompt MESSAGES['rules'][rule_line]
    sleep(1)
    break if rule_line == 11
    rule_line += 1
  end

  sleep(1)
  display_header()
end

def display_header
  system "clear"
  prompt MESSAGES['introduction']
end

def prompt(message)
  puts message
end

def determine_winner(player, computer, combinations)
  combinations[player][computer]
end

def grand_winner?(score)
  score['player'] == 3 || score['computer'] == 3
end

def declare_grand_winner(winner)
  sleep(2)
  puts "#{winner} has won 3 games! #{winner} is the grand winner!"
end

def display_results(choice, computer_choice, winner)
  print("You chose #{choice}; Computer chose #{computer_choice}: ")
  prompt MESSAGES['results'][winner]
end

def update_score(winner, score)
  if winner == 'player'
    score['player'] += 1
  elsif winner == 'computer'
    score['computer'] += 1
  end
end

def display_score(score)
  puts "player - #{score['player']}  computer - #{score['computer']}"
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

score = { 'player' => 0, 'computer' => 0 }

display_header()
prompt("Do you want to hear the rules? [y]es ")
answer = gets.chomp
# explain rules
explain_rules() if answer.downcase().start_with?('y')

loop do
  choice = ''
  loop do
    # intro to program
    display_header()
    # player chooses
    prompt MESSAGES['directions']
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

  computer_choice = VALID_CHOICES.sample
  winner = determine_winner(choice, computer_choice, combinations)
  display_results(choice, computer_choice, winner)
  update_score(winner, score)
  display_score(score)

  if grand_winner?(score)
    declare_grand_winner(winner)
    break
  else
    prompt("Do you want to play again?")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
  end
end

prompt("Thank you for playing. Good bye!")
