## Question1: variables in an if clause are initialized to nil
## Question2: << mutates
## Question3: variable scope
## Question4:

## Question1: (wrong)

What do you expect when the `greeting` variable is referenced in the last
line of the code below?
```ruby
if false
  greeting = "hello world"
end

greeting
```
**my answer**

an exception

**solution**

`greeting` is `nil` because the local variable is still being initialized
inside the `if` clause to `nil`; it is only IF the clause is executed
that its variable is assigned to something else. But first, it's `nil`



## Question2:

What is the result of the code below?
```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```
**my answer**

puts informal_greeting displays 'hi there'
puts greetings displays { a: 'hi there' }
this is because the mutation with `<<` mutated the object
that informal_greeting pointed to, which was the value of greetings[:a]

if you want to modify `informal_greeting` and not `greetings`, there are
some ways to go about it.

1) informal_greeting = informal_greeting + ' there'
2) informal_greeting = greetings[:a].clone



## Question3:

In other practice problems, we have looked at how the scope of variables
affects the modification of one "layer" when they are passed to another.

To drive home the salient aspects of variable scope and modification of one
scope by another, consider the following similar sets of code.

What will be printed by each of these code groups?

```ruby
#                   (A)
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

**my answer**

`one is: two`
`two is: three`
`three is: two`

**solution**

`one is: one`
`two is: two`
`three is: three`



```ruby
#                   (B)
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

**my answer**

`one is: one`
`two is: two`
`three is: three`



```ruby
#                   (C)
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```
**my answer**

`one is: two`
`two is: three`
`three is: one`




## Question4:

Ben was tasked to write a simple ruby method to determine if an input is an IP
address representing dot-separated numbers. e.g. "10.4.5.11". He is not
familiar with regular expressions. Alyssa supplied Ben with a method called
`is_an_ip_number?` that determines if a string is a numeric string between `0`
and `255` as required for IP numbers and asked Ben to use it.

```ruby

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true    # when should this method return false


    # INSPECT size of array
    # split the input string using . as a delimter
    # if the resulting array of words isnt comprimsed of
    # 4 distinct components, return false immediately

    # INSPECT each word in array of words
    # if its true, proceed to inspect every word in 
    # array of words. If at any point the current
    # word is not valid, return false immediately

    # RETURN TRUE IF ALL OTHER CONDITIONS HAVE BEEN SATISFIED
    # if you're done evaluating all the words in array of words
    # and you haven't found any invalid words,
    # return true
end
```



Alyssa reviewed Ben's code and says "It's a good start, but you missed a few
things. You're not returning a false condition, and you're not handling the
case that there are more or fewer than 4 components to the IP address 
(e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.

**my answer**

```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  dot_separated_words.each do |word|
    return false unless is_an_ip_number?(word)
  end
  return true
end
```

there are 2 things that are wrong with Ben's code.

1) there is no condition that checks for the number of numbers
in the input_string. As all valid ip addresses have 4, the condition should
check for 4.

If this condition isnt satisifed, execution can stop immediately and
the method can return `false`

2) The `break unless` statement merely exits the loop; it doesnt
    change any variable as a result of finding invalid characters within
    input string. Therefore, I changed the statement to a `return false`
    because finding an invalid character anywhere disqualifies the input
    from being recognized as valid.

**solution**

```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
```

**notes**

`return false unless` may be unfamiliar, but the intent matches the
scrutinizing nature of the method, especially when it is repeated twice
repeating it twice in this way also makes it easier to spot the conditions
This is why it's worth noting, despite my solution working just fine
oh, and `return true` can be shortened to `true`
