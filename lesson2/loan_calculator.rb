require 'yaml'
MESSAGES = YAML.load_file('loan_messages.yml')

def prompt(message)
  print("\n#{message}")
end

def continue?
  prompt MESSAGES['ask for continue']
  gets.chomp.casecmp?('y')
end

def get_loan_amount
  loop do
    prompt MESSAGES['ask for loan amount']
    amount = gets.chomp

    return amount.to_f if valid_amount?(amount)

    prompt MESSAGES['invalid']
  end
end

def get_loan_apr
  loop do
    prompt MESSAGES['ask for loan apr']
    apr = gets.chomp

    return apr.to_f if valid_apr?(apr)

    prompt MESSAGES['invalid']
  end
end

def get_loan_duration
  loop do
    prompt MESSAGES['ask for loan duration']
    duration = gets.chomp

    return duration.to_f if valid_duration?(duration)

    prompt MESSAGES['invalid']
  end
end

def valid_amount?(string)
  /^[1-9][0-9]*(?:.?[0-9]{2})$/.match(string)
end

def valid_apr?(string)
  /^[0-9]{1,3}(?:.?[0-9]{1,2})$/.match(string)
end

def valid_duration?(string)
  /^[1-9][0-9]*$/.match(string)
end

def calculate_monthly_payment(loan_terms)
  # loan_terms[:monthly_interest_rate] * loan_terms[:amount]
end

def display_loan_terms(loan)
  print "\n  You would like to borrow $#{loan[:amount]}"
  puts " at a monthly interest rate of #{loan[:monthly_interest_rate]}%"
  puts "  over the course of #{loan[:duration_months]} months"
  puts "  your monthly payment is $#{loan[:monthly_payment]}\n"
end

def convert_to_months(years)
  years * MONTHS_IN_YEAR
end

def convert_to_monthly_interest_rate(apr)
  convert_to_decimal(apr) / MONTHS_IN_YEAR
end

def convert_to_decimal(percentage)
  percentage * 0.01
end

MONTHS_IN_YEAR = 12

loan = { amount: 0,
         monthly_interest_rate: 0,
         duration_months: 0,
         monthly_payment: 0 }

loop do
  system "clear"
  prompt MESSAGES['introduction']

  loan[:amount] = get_loan_amount
  puts "lets validate the loan amount: #{loan[:amount]}"

  loan[:duration_months] = convert_to_months(get_loan_duration)
  puts "lets validate the loan duration: #{loan[:duration_months]}"

  loan[:monthly_interest_rate] = convert_to_monthly_interest_rate(get_loan_apr)
  puts "lets validate the loan apr: #{loan[:monthly_interest_rate]}"
  sleep(2)

  loan[:monthly_payment] = calculate_monthly_payment(loan)

  system "clear"
  prompt MESSAGES['introduction']
  display_loan_terms(loan)

  break if continue? == false
end

prompt MESSAGES['goodbye']
