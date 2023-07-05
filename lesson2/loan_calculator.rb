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
  gets.chomp.to_f
end

def get_loan_duration
  print("Loan duration (in years): ")
  gets.chomp.to_f
end

def get_loan_apr
  print("Annual Percentage Rate (just numbers):")
  gets.chomp.to_f
end

def calculate_monthly_payment(loan_terms)
  loan_terms[:monthly_interest] * loan_terms[:amount]
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

loan = { amount: 0,
         monthly_interest: 0,
         duration_months: 0,
         monthly_payment: 0 }

loop do
  system "clear"
  prompt MESSAGES['introduction']

  prompt MESSAGES['ask for loan amount']
  loan[:amount] = get_loan_amount
  puts "lets validate the loan amount: #{loan[:amount]}"

  prompt MESSAGES['ask for loan duration']
  loan[:duration_months] = convert_to_months(get_loan_duration)
  puts "lets validate the loan duration: #{loan[:duration_months]}"

  prompt MESSAGES['ask for loan apr']
  loan[:monthly_interest] = get_loan_apr
  puts "lets validate the loan apr: #{loan[:monthly_interest]}"

  loan[:monthly_payment] = calculate_monthly_payment(loan)

  puts "here's the amount you want to borrow: #{loan[:amount]}"
  puts "you'll be paying #{loan[:monthly_interest]} interest on it"
  puts "over #{loan[:duration_months]} months"
  puts "and paying #{loan[:monthly_payment]} every month"

  break if continue? == false
end
