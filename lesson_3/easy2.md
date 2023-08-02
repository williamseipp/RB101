## Question1: search hash for key
## Question2: manipulate string 'case' with methods
## Question3: append a hash
## Question4: search a string
## Question5: create an array with easy syntax
## Question6: append an array with one item
## Question7: append an array with multiple items
## Question8: take a slice from an array
## Question9: count characters in a string
## Question10: center a string




## Question1

In this hash of people and their age, see if "Spot" is present

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

**my answer**

ages.include?
ages.has_key?
ages.key?
ages.member?
ages.each { |key,value| puts "true" if key == "Spot" }




## Question2

```ruby
munsters_description = "The Munsters are creepy in a good way."
```

"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."

**my answer**

1. #swapcase!
2. #capitalize!
3. #downcase!
4. #upcase!




## Question3

We have most of the Munster family in our age hash. Add ages for
Marilyn and Spot to the existing hash.

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

```



**my answer**

ages.merge!(additional_ages)




## Question4

See if the name "Dino" appears in the string below:

```ruby
advice = "Few things in life are as important as 
    house training your pet dinosaur."
```


**my answer**

advice.include?("Dino")

**note**

Included solution uses #match? but as this returns a match data object,
I think include? is superior b/c the intent is to verify







## Question5

Show an easier way to write this array:

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
```
**my answer**

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)




## Question6

How can we add the family pet "Dino" to our usual array:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

**my answer**

flintstones.append("Dino")
or
flintstones << "Dino"




## Question7

In the previous practice problem we added dino to our array like this:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```

We could have used either Array#concat or Array#push to add Dino
How can we add multiple items to our array? (Dino and Hoppy)


**my answer**

flintstones.append("Dino", "Hoppy")

**note**

Solution states that Array#concat could have been used, though
this accepts only an array. Dino and Hoppy were referred to as
"items" and not specifically of an array type, nor was Dino
said to be an array in previous problems.




## Question8

Shorten the following sentence:

```ruby
advice = "Few things in life are as important as 
    house training your pet dinosaur."
```

Use the method String#slice! to return `Few things in life are as important as `

But leave the `advice` variable as `house training your pet dinosaur`

**my answer**

advice.slice!(/F.*as /)
If you used `String#slice` instead, advice would remain unchanged

**note**

solution uses `advice.slice!(0, advice.index('house'))`
This is a better solution because how it works is more obvious than regex!





## Question9

Write a one-liner to count the number of lower-case 't' characters in the
following string:

`statement = "The Flintstones Rock!"`

**my answer**

statement.count 't'




## Question10

Back in the stone age (before CSS) we used spaces to align things on the
screen. If we had a table of Flintstone family members that was forty
characters in width, how could we easily center that title above the table with
spaces?

```ruby
title = "Flintstone Family Members"
```

**my answer**

title.center(40)








