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
      loan_duration[:years] = years.to_i
      loan_duration[:months] = months.to_i
      break
    else
      prompt MESSAGES['invalid duration']
    end
  end
  loan_duration
end

def valid_loan_amount?(string)
  number?(string) && string.to_f > 0 &&
    decimal_to_two_places?(string)
end

def valid_loan_duration?(years_string, months_string)
  (whole_number?(years_string) && whole_number?(months_string)) &&
    !(zero?(years_string) && zero?(months_string))
end

def valid_apr?(string)
  number?(string) && string.to_f >= 0
end

def number?(string)
  Float(string, exception: false) != nil
end

def whole_number?(string)
  number?(string) && !(string.include?('.'))
end

def decimal_to_two_places?(string)
  if string.include?('.')
    string.length == string.index('.') + 3
  else
    true
  end
end

def zero?(string)
  string.to_i == 0
end

def display_loan_terms(loan)
  print "\n  For a $#{loan[:amount]} loan "
  print "with #{decimal_to_percentage(loan[:monthly_interest_rate] * MONTHS_IN_YEAR)}% APR "
  puts "over #{loan[:duration_months]} months,"
  puts "  your monthly payment is $#{loan[:monthly_payment]}\n"
end

def calculate_monthly_payment(loan = {})
  if loan[:monthly_interest_rate] == 0
    monthly_payment = loan[:amount] / loan[:duration_months]
  else
    monthly_payment = loan[:amount] *
                      (loan[:monthly_interest_rate] /
                      (1 - ((1 + loan[:monthly_interest_rate])**(-loan[:duration_months]))))
  end
  monthly_payment.round(2)
end

def convert_to_months(years_and_months = {})
  (years_and_months[:years] * MONTHS_IN_YEAR) +
    years_and_months[:months]
end

def apr_to_monthly_interest_rate(apr)
  percentage_to_decimal(apr) / MONTHS_IN_YEAR
end

def percentage_to_decimal(percentage)
  percentage * 0.01
end

def decimal_to_percentage(decimal)
  decimal * 100
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
  system "clear"
  prompt MESSAGES['introduction']

  loan[:duration_months] = convert_to_months(get_loan_duration)
  system "clear"
  prompt MESSAGES['introduction']

  loan[:monthly_interest_rate] = apr_to_monthly_interest_rate(get_loan_apr)
  system "clear"
  prompt MESSAGES['introduction']
  sleep(1)

  loan[:monthly_payment] = calculate_monthly_payment(loan)

  display_loan_terms(loan)

  break if continue? == false
end

prompt MESSAGES['goodbye']
