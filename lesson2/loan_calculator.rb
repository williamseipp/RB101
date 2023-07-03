# psuedocode
#
# 1. introduce the program
# 1a. greet user
# 1b. ask for name
# 1c. tell user what the program does
#
# 2. have user fill out the loan terms sheet
# 2a. ask user for loan amount and provide examples
# 2b. validate loan amount
# 2c. ask user for loan duration and provide examples
# 2d. validate loan duration
# 2e. ask user for apr and provide examples
# 2f. validate apr
#
# 3. calculate the monthly payment
# 3a. apply formula with loan terms given
# 3b. save the monthly payment
#
# 4. display the monthly payment of the loan
# 4a. show the loan terms in a clean way with the monthly payment
#
# 5. ask for further input
# 5a. ask user if they want to calculate another loan
# 5b. validate user answer
# 5c. quit the program or repeat step 1
#
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

#     greet user and ask for name
prompt('welcome to the mortgage calculator')
prompt("what's your name? ")

name = ''
loop do
  name = gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Nice to meet you #{name}, I hear you're interested in calculating a
monthly payment. First, I'll need some details. Could I have the loan amount?")

#     prompt user for loan_amount
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

#     prompt user for loan_duration_years
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

# prompt user for apr
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

# confirm the terms of the loan with user before answering
puts "Here are the terms of the loan:\n"
puts "The loan amount is $#{loan_amount}"
puts "Monthly interest rate is #{monthly_interest_rate}"
puts "The loan duration is #{loan_duration_months} months"
#
#   >>  APPLY formula and solve for m
#     apply formula with loan_amount, loan_duration_months
#     and monthly_interest_rate and save the result as monthly_payment
#
#   >>  DISPLAY m to user
#     display monthly_payment in the proper format
