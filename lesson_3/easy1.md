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

## answer 1

    1
    2
    2
    3

numbers has not been mutated because Array#uniq does NOT mutate the caller


## Question2
Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

    what is != and where should you use it?
    put ! before something, like !user_name
    put ! after something, like words.uniq!
    put ? before something
    put ? after something
    put !! before something, like !!user_name

## Answer 2


## Question3

Replace the word "important" with "urgent" in this string:
```ruby
advice = "Few things in life are as important 
as house training your pet dinosaur."
```

## Answer 3


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

## Answer 4


## Question5

Programmatically determine if 42 lies between 10 and 100.

hint: Use Ruby's range object in your solution.


## Answer 5

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

## Answer 6


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

## Answer 7


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

## Answer 8

