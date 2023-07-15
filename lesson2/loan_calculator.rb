require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('loan_messages.yml')

def prompt(message)
  print("\n#{message}")
end

def continue?
  prompt MESSAGES['ask for continue']
  gets.chomp.casecmp?('y')
end

def get_loan_amount
  prompt MESSAGES['ask for loan amount']
  loop do
    amount = gets.chomp
    return amount.to_f if valid_loan_amount?(amount)
    prompt MESSAGES['invalid amount']
  end
end

def get_loan_apr
  prompt MESSAGES['ask for loan apr']
  loop do
    apr = gets.chomp
    return apr.to_f if valid_apr?(apr)
    prompt MESSAGES['invalid apr']
  end
end

def get_loan_duration
  loan_duration = { years: 0, months: 0 }

  loop do
    prompt MESSAGES['ask for loan duration years']
    years = gets.chomp

    prompt MESSAGES['ask for loan duration months']
    months = gets.chomp

    if valid_loan_duration?(years, months)
      loan_duration[:years] = years.to_f
      loan_duration[:months] = months.to_f
      break
    else
      prompt MESSAGES['invalid duration']
    end
  end
  loan_duration
end

def valid_loan_amount?(string)
  number?(string) && string.to_f > 0 && decimal_to_two_places?(string)
end

def decimal_to_two_places?(string)
  /^\d*(?:.?)\d{2}$/.match(string)
end

def valid_apr?(string)
  number?(string) && string.to_f > 0
end

def valid_loan_duration?(years_string, months_string)
  (whole_number?(years_string) && whole_number?(months_string)) &&
    !(zero?(years_string) && zero?(months_string))
end

def number?(string)
  Float(string, exception: false) != nil
end

def whole_number?(string)
  number?(string) && !(string.include?('.'))
end

def zero?(string)
  string.to_i == 0
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

def convert_to_months(years_and_months = {})
  (years_and_months.fetch(:years) * MONTHS_IN_YEAR) +
    years_and_months.fetch(:months)
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
