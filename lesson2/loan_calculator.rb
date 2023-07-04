require 'yaml'

# methods
def prompt(message)
  puts("\n#{message} \n")
end

def positive_num?(loan)
  if loan.to_i.to_s
    loan.to_i > 0
  elsif loan.to_f.to_s
    loan.to_f > 0
  else
    false
  end
end

# constants and variables
MESSAGES = YAML.load_file('loan_messages.yml')

# MAIN LOOP
# introduce program
system "clear"
prompt MESSAGES['introduce program']

#     ask for name
#     get name
#     validate name
#     greet by name
prompt MESSAGES['ask for name']
name = ''
loop do
  name = gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

# greet by name
system "clear"
prompt MESSAGES['introduce program']
puts "\nHello #{name}"
sleep(1)
system "clear"

# ask for loan amount
# get loan amount
# validate loan amount
system "clear"
prompt MESSAGES['introduce program']

loan_amount = ''
loop do
  print("Loan amount (just numbers): ")
  loan_amount = gets.chomp
  if positive_num?(loan_amount)
    break
  else
    prompt("I'm sorry, thats not a valid amount. Please try again.")
  end
end

# ask for loan duration
# get loan duration
# validate loan duration
prompt MESSAGES['ask for loan duration']
loan_duration_years = ''
loop do
  print("Loan duration (in years): ")
  loan_duration_years = gets.chomp
  if positive_num?(loan_duration_years)
    break
  else
    prompt("I'm sorry, thats not a valid amount. Please try again.")
  end
end

# ASK FOR loan's apr
# get loan's apr
# validate apr
# set loan's apr
prompt MESSAGES['ask for apr']
apr = ''
loop do
  print("Annual Percentage Rate (just numbers):")
  apr = gets.chomp
  if positive_num?(apr)
    break
  else
    prompt("I'm sorry, thats not a valid amount. Please try again.")
  end
end

# convert user input into forms required by formula
monthly_interest_rate = apr.to_f / 12 / 100
loan_duration_months = loan_duration_years.to_i * 12

# calculate loan's monthly payment

# display loan terms
# display monthly payment
puts "Here are the terms of the loan:\n"
puts "The loan amount is $#{loan_amount}"
puts "Monthly interest rate is #{monthly_interest_rate}"
puts "The loan duration is #{loan_duration_months} months"
