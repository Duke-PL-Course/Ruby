# First let's cover some common datatypes
# NOTE: _Everything_ in Ruby is an object
42.class      # => Fixnum
42.0.class    # => Float
"foo".class   # => String
[1,2,3].class # => Array

# Let's prove that these are objects
42.methods    # shows the methods available on the object

# In addition to being object-oriented, Ruby is strongly typed
4 + 4       # => 8
4 + "foo"   # results in a TypeError
4 + 4.0     # => 8.0      this works because of type coercion
# What about this though?
def add_stuff
  4 + "foo"
end # => nil
add_stuff # => TypeError    This proves that Ruby is dynamically typed

# Types, types, types. More about Ruby's type system:
#   Ruby is duck-typed, meaning that if two objects of different
#   classes have the same method signature, then they can be used together
i = 0
a = ['100', 100.0, '50', 50.0]
while i < a.size
  puts a[i].to_i
  i = i + 1
end

# Alright, how about defining variables and calling functions?
foo = 'hello, plcourse' # here we define a function. Notice there's no type declaration
puts(foo)               # this prints "hello, plcourse" and returns nil
puts foo                # this is exactly the same as above, with a bit of syntactic sugar
foo = 'is mutable'      # variables are mutable, i.e. they can vary
CONSTANTS = 'are defined like this' # they are immutable

# An interesting thing about arrays is they can contain mixed types
[1, "two", 3] # is perfectly valid
Array.new     # remember, these are objects, and objects can be instantiated
              #   with .new()

# We saw a bit of defining a function earlier in add_stuff
# Notice that you didn't need to specify parameter types, return types, or even a return statement
def be_truthful
  42
  true    # The last expression is always the one that gets returned
end


# TODO: Array accessors
cars = ['ford', 'toyota', 'subaru']
cars[0]     # => "ford"
cars[2]     # => "subaru"
cars[-1]    # => "subaru"
cars[-4]    # => nil
cars[9001]  # => nil
cars[1..2]  # => ["toyota", "subaru"]
cars[1..2]  # => ["toyota", "subaru"]
cars[0...2] # => ["ford", "toyota"]
cars.[](0...2)# => ["ford", "toyota"]
