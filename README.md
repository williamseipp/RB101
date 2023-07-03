## RB101 notes

The act of note-taking forces a basic review. The end product
acts as a index of all the relevant course material and serves
as a base from which to study from.

## Table of Contents

1.  [Introduction](https://github.com/williamseipp/RB101#Introduction)
2.  [Preparations](https://github.com/williamseipp/RB101#Preparations)
3.  [Quiz1](https://github.com/williamseipp/RB101#Quiz1)
4.  [Small Programs](https://github.com/williamseipp/RB101#Small Programs)
5. [Walk-through: calculator](https://github.com/williamseipp/RB101#)
6. [Pseudo-code](https://github.com/williamseipp/RB101#)
7. [Flowchart](https://github.com/williamseipp/RB101#)
8. [Ruby version manager](https://github.com/williamseipp/RB101#)
9. [Rubocop](https://github.com/williamseipp/RB101#)
10. [Walk-through: refactoring calculator](https://github.com/williamseipp/RB101#)
11. [Debugging](https://github.com/williamseipp/RB101#)
12. [Precedence](https://github.com/williamseipp/RB101#)
13. [Assignment: calculator bonus features](https://github.com/williamseipp/RB101#)
14. [Assignment: mortgage / car loan calculator](https://github.com/williamseipp/RB101#)
15. [Coding tips](https://github.com/williamseipp/RB101#)
16. [Variable scope](https://github.com/williamseipp/RB101#)
17. [Pass by reference vs pass by value](https://github.com/williamseipp/RB101#)
18. [Walk-through: rock paper scissors](https://github.com/williamseipp/RB101#)
19. [Coding tips 2](https://github.com/williamseipp/RB101#)
20. [Assignment: RPS bonus features](https://github.com/williamseipp/RB101#)
21. [Summary](https://github.com/williamseipp/RB101#)
22. [Quiz2](https://github.com/williamseipp/RB101#)
23. [Practice problems](https://github.com/williamseipp/RB101#)

## Introduction

These are my notes for the RB101 course, broken down by lesson & topic.
Some topics were ommitted.

### Preparations

Being social has many benefits, so get started early. Ask specific questions
after trying it out yourself and documenting your work. Also, commit often.

#### solving problems
* read [small problems primer](https://launchschool.com/gists/2a3a3d72)
* do [RB101-RB119-Small Problems](https://launchschool.com/exercises#rb101rb119_small_problems)
 * easy: for 109 assessments, grok syntax, conditionals, loops, fundamental data types, common methods
 * medium: for 119 interview assessment, read the docs often and do independent research
 * hard: to gain mastery compare your answers, revisit difficult questions, challenge yourself

### Quiz1

**lesson learned: test your hypothesis**

I was told to select all methods that returned an array of integers
with values that correspond to lengths of the words in the corresponding
sentence. I didn't confirm the return value of the call to `each`.

```ruby
def string_lengths(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|      # each returns a new array, not lengths
    lengths << string.size
  end
end
```

### Small Programs

In this lesson, you write small programs that get harder. 
Think about a program's logic and how to debug.

### Walk-through: calculator
The command line calculator should do the following:

* asks for two numbers
* asks for the type of operation to perform: add,subtract,multiply or divide
* displays the result
* uses Kernel.gets() and Kernel.puts()

### Pseudo-code and flowchart
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

**steps**
 1. Reproduce the Error:
 2. Determine boundaries: try different inputs to find scope of the error
 3. Trace the code: look at execution backwards and "trap" the error
 4. Understand the problem well: examine in depth how the error occurs
 5. Fix: one problem at a time
 6. Test: does this fix work for all inputs?

**techniques**
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

### Assignment: calculator bonus features
### Assignment: mortgage / car loan calculator
### Coding tips
### Variable scope
### Pass by reference vs pass by value
### Walk-through: rock paper scissors
### Coding tips 2
### Assignment: RPS bonus features
### Summary
### Quiz2
### Practice problems

