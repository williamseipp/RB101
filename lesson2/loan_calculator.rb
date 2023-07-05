require 'yaml'
MESSAGES = YAML.load_file('loan_messages.yml')

def prompt(message)
  puts("\n#{message} \n")
end

def positive_num?(num)
  if num.to_i.to_s
    num.to_i > 0
  elsif num.to_f.to_s
    num.to_f > 0
  else
    false
  end
end

def continue?
  puts "do you want to continue? Enter y to continue"
  gets.chomp == 'y'
end

def get_loan_amount
  print("Loan amount (just numbers): ")
  gets.chomp
end

def get_loan_duration
  print("Loan duration (in years): ")
  gets.chomp
end

def get_loan_apr
  print("Annual Percentage Rate (just numbers):")
  gets.chomp
end

def calculate_monthly_payment(_loan)
  10.99
end

def convert_to_months(years)
  years * MONTHS_IN_YEAR
end

def convert_to_monthly_interest_rate(apr)
  apr / MONTHS_IN_YEAR / 100
end

def convert_to_decimal(percentage)
  percentage * 0.01
end

MONTHS_IN_YEAR = 12

loop do
  system "clear"
  prompt MESSAGES['introduction']

  prompt MESSAGES['ask for loan amount']
  loan_amount = get_loan_amount
  puts "lets validate the loan amount: #{loan_amount}"

  prompt MESSAGES['ask for loan duration']
  loan_duration_years = get_loan_duration
  puts "lets validate the loan duration: #{loan_duration_years}"

  prompt MESSAGES['ask for loan apr']
  loan_apr = get_loan_apr
  puts "lets validate the loan apr: #{loan_apr}"

  monthly_payment = calculate_monthly_payment(30)

  puts "here's the amount you want to borrow: #{loan_amount}"
  puts "you'll be paying #{loan_apr} interest on it"
  puts "over #{loan_duration_years} years"
  puts "and paying #{monthly_payment} every month"

  break if continue? == false
end
