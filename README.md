## What is this?

These are my notes for the RB101 course. 
It is structured like so: course.lesson.topic.notes
Topics that were 'unnecessary' were ommitted.

### lesson1: Preparations
* being social has many benefits; get started early
* ask questions after doing it yourself and document your work
* commit your work often

#### solving problems
* read [small problems primer](https://launchschool.com/gists/2a3a3d72)
* do [RB101-RB119-Small Problems](https://launchschool.com/exercises#rb101rb119_small_problems)
 * easy: for 109 assessments, grok syntax, conditionals, loops, fundamental data types, common methods
 * medium: for 119 interview assessment, read the docs often and do independent research
 * hard: to gain mastery compare your answers, revisit difficult questions, challenge yourself

### lesson 1 quiz

**incorrect answer**

>> which method definitions meet these requirements:
>> * 1 string argument
>> * returns an array of integers
>> * value of each integer in the array = length of the word in the corresponding
>>  position in the sentence. 'sudo poweroff' => [4,8]

```ruby
def string_lengths(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|      # each returns a new array, not lengths
    lengths << string.size
  end
end
```

It _"looked right"_ but didn't confirm what the method + block did;
I could have done this by reading [docs](https://ruby-doc.org/3.2.2/Array.html#method-i-each)
or using irb

>> **habit: test your hypothesis**

### lesson2: small programs

In this lesson, you write small programs that get harder. 
Think about a program's logic and how to debug.

### ruby style
    
constant variables do not change
    FIVE = 5

use {} for blocks if the expression fits on a single line

```ruby
    [1.2.3].each {|num| print "#{num} "

    class MyFirstClass
    end

```

**concept: "truthiness"**

because all expressions evaluate to "truthy" except false and nil,
the code below works:      

```ruby
    if name && name.valid?
```

### walk-through: calculator
The command line calculator should do the following:

* asks for two numbers
* asks for the type of operation to perform: add,subtract,multiply or divide
* displays the result
* uses Kernel.gets() and Kernel.puts()

### pseudo-code and flowchart: focus on the logic first
pseudo-code and flowcharts allow you to focus on the logic of a problem


**concept** "declarative": describe what the result should be
**concept** "imperative": specify how to obtain result

Start with a high-level declarative syntax and use imperative for specific
implementation details

Here are some keywords, their meaning, and the corresponding flowchart symbol
START:      start of program                    ellipse: start/stop
SET:        sets a variable                     square: processing step
GET:        retrieve input from user            parallelogram: input/output
PRINT:      displays output to user             ??
READ:       retrieve value from variable        square: processing step
IF/ELSE IF  show conditional branches in logic  diamond: decision
WHILE       show looping logic                  connector+arrows
END         end of the program                  ellipse: start/stop

### ruby version manager: manage your ruby environment

I chose rbenv earlier because I read that rbenv is simpler

### rubocop: static code analyzer

static code analyzer that offers advice about style format and logical errors
use a .rubocop.yml file to configure which rules rubocop should use

### walk-through: refactoring calculator

implement the following:
* looping behavior
* input validation
* refactor of prompts
* better readability

### debugging: follow protocol and use good techniques

temperment: learn to deal with frustration, then systematically search
reading error messages: embrace reading stack traces; you'll improve
online resources: google, stack overflow, documentation

### steps
 1. Reproduce the Error:
 2. Determine boundaries: try different inputs to find scope of the error
 3. Trace the code: look at execution backwards and "trap" the error
 4. Understand the problem well: examine in depth how the error occurs
 5. Fix: one problem at a time
 6. Test: does this fix work for all inputs?

### techniques
 1. line by line: inspect code with an attention to detail
 2. rubber duck: talk it out to something and you'll uncover errors
 3. walking away: take a break and let the problem simmer in your brain
 4. pry: insert breakpoint with "binding.pry" and examine variables
 5. using a debugger: pry can be used in this way

### precedence is complicated: just use parentheses!

example 1: 

```ruby
    > 3 + 5 * 7
```

the * operator has higher precedence than the +, so 
5 and 7 get passed to * as operands. * **binds** more
tightly to 5 than +

example 2:

```ruby
    array.map do |num|
      num + 1
    end
    # outputs [2, 3, 4]

    p array.map do |num|
      num + 1
    end
    # outputs #<Enumerator: [1, 2, 3]:map>

```

Why is it printing an enumerator when we expect an array?
because `do...end` blocks have the lowest precedence, 
`p` and `array.map` are tighter than `map do`. It's as if
this was written: `p(array.map)`

**Ruby's tap method**

Object#tap allows passing of self into a block in order to debug
intermediate objects in method chains like so...

```ruby
    (1..3).tap { |x| p x }.to_a        # 1..3 is shown
                                        # => [1, 2, 3]
```

similar to pry, it allows you to verify that the object you're
referring to in a method chain is what you think it is

### assignment: calculator bonus features

### assignment: mortgage / car loan calculator

### coding tips

### variable scope

### more variable scope

### pass by reference vs pass by value

### walk-through: rock paper scissors

### coding tips 2

### assignment: RPS bonus features

### summary

### quiz


### lesson3: practice problems
