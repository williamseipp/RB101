## Question1: object_id
## Question2:
## Question3:
## Question4:
## Question5:
## Question6:



## Question1:

Every object in Ruby has access to a method called `object_id`, which returns a
numerical value that uniquely identifies the object. This method can be used to
determine whether two variables are pointing to the same object. What does
the following code output?

```ruby
a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id
```

**answer**

a and c have the same object_id
b has its own object_id



## Question2: (wrong)

Let's take a look at a similar example as the previous question.
What does the following code output?

```ruby
a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id
```


**answer**

a and c have the same object_id, while b has its own distinct object_id

**solution**

There can only be ONE `42` integer object! Because `42` already existed,
`b = 42` is pointing to the same object. Weird!


**note**
`true`, `false` and `nil` are also immutable, and have the same characteristic
(every instance of `true` refers to the one and only `true`)


## Question3:

Let's call a method, pass two strings as arguments and see how they can be
treated differently depending on the method invoked on them inside the method
definition.

Study the following code and state what will be displayed...and why:
```ruby

def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga"
  string_param_two << "rutabaga"
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}"
puts "String_arg_two looks like this now: #{string_arg_two}"
```

**answer**
String_arg_one looks like this now: pumpkins
String_arg_two looks like this now: pumpkinsrutabaga

`+=` does not mutate string_param_one
`<<` does mutate string_param_two

**important note**

In both cases, Ruby passes the arguments "by value", but unlike some other
languages, the value that gets passed is a reference to some object. The string
arguments are passed to the method as references to objects of type String.

The important distinction is that while a reference is passed, the method
initializes new local variables for both strings and assigns each reference to
the new local variables. These are variables that only live within the scope of
the method definition.



## Question4:

To drive that last one home...let's turn the tables and have the string show a
modified output, while the array thwarts the method's efforts to modify the
user's version of it.

Again, what is the output?
```ruby
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

**answer**

`My string looks like this now: pumpkinsrutabaga`
`My array looks like this now: ["pumpkins"]`



## Question5

Depending on a method to modify its arguments can be tricky:
```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

Whether the above "coincidentally" does what we think we wanted depends on what
is going on inside the method

How can we change this code to make the result easier to predict and easier for
the next programmer to maintain? That is, the resulting method should not
muytate either agument, but my_string should be set to 'pumpkinsrutabaga' and
my_array should be set to ['pumpkins', 'rutabaga']

**answer**



## Question6
**answer**
