## Question1: does this method mutate?
## Question2: explain difference between ! and ? 
## Question3: mutate the string 
## Question4: what is the difference between Array #delete & #delete_at
## Question5: query a range
## Question6: concatentate a string in two ways
## Question7: un-nest an array
## Question8: return a specific Array from a Hash


## Question1

What would you expect the code below to print out?

```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```

**my answer**

    1
    2
    2
    3

numbers has not been mutated because Array#uniq does NOT mutate the caller


## Question2
Describe the difference between ! and ? in Ruby. 
And explain what would happen in the following scenarios:

1. what is != and where should you use it?
2. put ! before something, like !user_name
3. put ! after something, like words.uniq!
4. put ? before something
5. put ? after something
6. put !! before something, like !!user_name

**my answer**

1. This is the comparison operator "not equals" and will evaluate
    to true if the operands are not the same, and false if they are

2. This is the NOT operator and will flip the state of the operand. 
    As anything that isnt `nil` or `false` will evaluate to `true`,
    placing a ! in front of it will cause the expression to evaluate
    to `false`

3. This is a naming convention for methods that mutate their caller.

4. This is a naming convention for methods that return a boolean value

5. It won't do anything by itself; the `?` begins a ternary operator
    in Ruby which technically is `?:`

6. This is two logical NOT operators. It will return the state of the
    operand, so in the case of `user_name`, it will return `true` if
    `user_name` isnt a `nil` or `false`

## Question3

Replace the word "important" with "urgent" in this string:
```ruby
advice = "Few things in life are as important 
as house training your pet dinosaur."
```

**my answer**

```ruby
advice.sub!('important','urgent')
```

**methods have subtle differences**
String#sub! replaces the first occurence of the matched word
String#gsub! replaces all occurences of the matched word.


## Question4
The Ruby Array class has several methods for removing items from the array. 
Two of them have very similar names. Let's see how they differ:

```ruby
numbers = [1, 2, 3, 4, 5]
```

What do the following method calls do (assume we reset numbers to the 
original array between method calls)?

```ruby
numbers.delete_at(1)
numbers.delete(1)

```

**my answer**

delete_at() removes element at specified index from Array and returns it
delete() deletes elements with specified value from Array and returns the
    last element removed

**note**

both of these methods return the removed element


## Question5

Programmatically determine if 42 lies between 10 and 100.

hint: Use Ruby's range object in your solution.


**my answer**

```ruby
set = 10..100
set.include?(42)
```

## Question6

Starting with the string:

```ruby
famous_words = "seven years ago..."
```

show two different ways to put the expected "Four score and" in front of it

**my answer**

```ruby
"Four score and" + famous_words
"Four score and" << famous_words
```


## Question7
If we build an array like this:

```ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
```

We will end up with this "nested" array:

```ruby
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
```

Make this into an un-nested array.

**my answer**

flintstones.flatten!

## Question8

Given the hash below

```ruby
flintstones = { "Fred" => 0, 
                "Wilma" => 1, 
                "Barney" => 2, 
                "Betty" => 3, 
                "BamBam" => 4, 
                "Pebbles" => 5 }
```

Create an array containing only two elements: Barney's name and Barney's number

**my answer**

just_barney = flintstones.slice("Barney").to_a.flatten

I tried looking for an array method but I couldn't find a method that returned
both the value AND the key. I figured then that a method probably existed of
the Hash class that returned a key,value pair that could then be then used to 
call a `to_a` method.

Turns out the method is `slice` and `to_a` returns an array as
needed (non-destructive). 

**note**
turns out the method exists already, called `Hash#assoc`
