## Question1: print a string multiple times with variation
## Question2: integer to string
## Question3: substitute control flow constructs
## Question4: Array#<< vs + concatentation
## Question5: methods cannot reference local variables
## Question6: numbers are immutable
## Question7: ruby passes object_id of arguments to methods (reference value)
## Question8: nested parentheses
## Question9: default parameters



## Question1: 

Write a one-line program that creates the following ouput 10 times, with the
subsequent line indented 1 space to the right:


**my answer**

phrase = "The Flintstones Rock!"
10.times { puts phrase.insert(0, ' ') }

This is incorrect, because this is not a one-liner

**solution**

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

I was trying to use `|number|` in a previous solution to print ` ` multiple
times, but gave up when I couldn't close the block with print and puts
statements together

**note**

```ruby
name = 'will'
name * 3        # => willwillwill
```

## Question2: 

The result of the following statement will be an error:

```ruby
puts "the value of 40 + 2 is " + (40 + 2)
```

Why is this and what are two possible ways to fix this?


**my answer**

the argument to puts is an invalid combination of a string and an integer
Fix #1: puts "the value of 40 + 2 is " + (40 + 2).to_s
Fix #2: puts "the value of 40 + 2 is " << (40 + 2).to_s

**solution**

puts "the value of 40 + 2 is #{40 + 2}"

**note**

dont forget about string interpolation!

## Question3:

Alan wrote the following method, which was intended to show all of the
factors of the input number:

```ruby
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
```

Alyssa noticed that this will fail if the input is 0, or a negative number, and
asked Alan to change the loop. How can you make this work without using the
begin/end until construct? Note that we're not looking to find the factors for
0 or negative numbers, but we just want to handle it gracefully instead of
raising an exception or going into an infinite loop.


Bonus 1: What is the purpose of the number % divisor == 0 ?
Bonus 2: What is the purpose of the second-to-last line (line 8) in the method
        (the factors before the method's end)?

**my answer**

```ruby
def factors(number)
  divisor = number
  factors = []
  begin
    break if divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
```

Bonus 1: The purpose of `number % divisor == 0` is to return an integer when
        no remainder exists, in which case the integer is a factor of number

Bonus 2: The purpose of line 8 is to return the array of factors

I made a mistake here. The problem asks for a solution WITHOUT usage of the
`begin/end` construct. 

**solution**

```ruby
while divisor > 0
  factors << number / divisor if number % divisor == 0
  divisor -= 1
end
```

This ensures that the body of the loop isnt evaluated at all for non-positive
values of `number`



## Question4:

Alyssa was asked to write an implementation of a rolling buffer.
Elements are added to the rolling buffer and if the buffer becomes full,
then new elements that are added will displace the oldest elements in
the buffer.

She wrote two implementations saying, "take your pick. 
Do you like `<<` or `+` for modifying the buffer?"

Is there a difference between the two, other than what operator she chose
to use to concatenate an element to the buffer?

```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```

**answer**

the method `rolling_buffer1` returns an array and mutates the original that
is passed in as an argument.

the method `rolling_buffer2` returns a new array

**solution**
Because the first method both returns something and has a side effect, the
second solution should be used

**note**

I didn't think to consider that returning a value AND mutating it was
bad practice because I thought that was the intent.



## Question5:

Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
A user passes in two numbers, and the calculator will keep computing the
sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he
got an error. Something about the limit variable. What's wrong with the code?

```ruby
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

**answer**
as I understand it, the method returns the sum of the numbers in the
Fibonacci sequence up to a limit. The only thing wrong with the code appears
to be the reference to a variable outside the scope of the method definition.
For this code to work, 'limit' must be passed in as an argument

```ruby
def fib(first_num, second_num, limit)
```


## Question6:

What is the output of the following code?

```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```

**answer**

the number `34` is displayed to the screen because `42 - 8` is 34.
the variable answer was not mutated because numbers are immutable in Ruby.
Assignments NEVER mutate!



## Question7:

One day Spot was playing with the Munster family's home computer and he wrote
a small program to mess with their demographic data:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```

After writing this method, he typed the following...and before Grandpa could
stop him, he hit the Enter key with his tail:

```ruby
mess_with_demographics(munsters)
```

Did the family's data get ransacked? Why or why not?

**answer**

It didn't get changed because the `Hash#each` does not mutate the caller

**solution**

It DID get changed. Ruby passed the `object_id` of `munsters` to the method
and any change to demo_hash is in fact a mutation of the existing hash.

## Question8:

Method calls can take expressions as arguments. Suppose we define a method
called rps as follows, which follows the classic rules of rock-paper-scissors
game: it returns the winning fist or, in the case of a tie, the first that 
both players played.

```ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
```

What is the result of the following call?
```ruby
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```

**answer**

"paper"


## Question9:

Consider these two simple methods. What is the return value following the
method invocation?

```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)
```

**answer**

foo's default parameter is "no", but it returns a "yes"
bar is called with the argument "yes"
Since the expression evaluates to `false`,
the return value is `"no"`

