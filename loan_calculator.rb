## PEDAC TEMPLATE

## assignment / problem statement

## problem
# formula m = p * (j / (1 - (1 + j)**(-n)))

#     INPUTS
#     loan_amount = p
#     apr
#     loan_duration_years
#
#     OUTPUTS
#     monthly_interest_rate = j
#     loan_duration_months = n
#     monthly_payment = m
#
# make the requirement explicit
# using calculator as a base, make a program that
# calculates the monthly payment for a mortgage given 3 inputs;
#
#   * loan amount or principal
#   * apr
#   * loan duration in years
#
# clarifying questions
#
#   * is interest expressed as a whole number '5' or decimal '0.5'?
#       as a whole or fractional number with a % after it, i.e 5%
#
#   * how do I convert apr into monthly_interest_rate?
#       1. convert the apr expressed as a percentage into decimal form
#           by dividing it by 100
#       2. convert this value into monthly_interest_rate by dividing
#           it by the number of months; 12
#
#   * how is loan duration expressed?
#       usually as a number of years, i.e 15 or 30
#
# identify the rules
#
#   * ask for the necessary pieces of information from the user
#   * validate that information
#   * convert that information into the correct form
#    * convert apr into monthly_interest_rate for the formula
#    * convert loan_duration_years into loan_duration_months for the formula
#    * the formula asks for loan duration in months; be explicit
#   * express the monthly_payment back to user
#

## examples

# validate understanding of the problem
#
# formula m = p * (j / (1 - (1 + j)**(-n)))
#
#  apr = 6
#  loan duration in years = 30
#  loan amount 100000
#
#  j = .005
#  n = 360
#  p = 100000
#
# mental model of the problem (optional)
#
#   ASK for info
#   VALIDATE info
#   CONVERT info into required values
#   APPLY formula and solve for m
#   display m to user
#
## data structure: how do we represent the data from input -> output?

# how do we represent the data that we will work with
# when converting the input to output
#
# again, what are the inputs?
#
# loan_amount = string > float
# apr = string > float
# loan_duration_years = string > float
#
# monthly_payment = float > string ( truncated )

## algorithm: what are the steps?

#   >>   ASK for loan terms
#     prompt user for loan_amount
#     if its invalid, tell the user its invalid and ask again
#     if its valid, save as loan_amount
#
#     prompt user for loan_duration_years
#     if its invalid, tell the user its invalid and ask again
#     if its valid, save as loan_duration_years
#
#     prompt user for apr
#     if its invalid, tell the user its invalid and ask again
#     if its valid, save as apr
#
#   >>  CONVERT info into required values
#     convert apr into decimal form of monthly_interest_rate
#     and save as monthly_interest_rate
#
#     convert loan_duration_years into loan_duration_months
#
#   >>  APPLY formula and solve for m
#     apply formula with loan_amount, loan_duration_months
#     and monthly_interest_rate and save the result as monthly_payment
#
#   >>  DISPLAY m to user
#     display monthly_payment in the proper format
#

## code

#     introduce the program
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
