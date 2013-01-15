# First let's cover some common datatypes
# NOTE: _Everything_ in Ruby is an object
42.class      # => Fixnum
42.0.class    # => Float
"foo".class   # => String
[1,2,3].class # => Array

# Let's prove that these are objects
42.methods    # shows the methods available on the object

# An interesting thing about arrays is they can contain mixed types
[1, "two", 3] # is perfectly valid
Array.new     # remember, these are objects, and objects can be instantiated
              #   with .new()

# Alright, how about defining variables and calling functions?
foo = 'hello, plcourse' # here we define a function. Notice there's no type declaration
puts(foo)               # this prints "hello, plcourse" and returns nil
puts foo                # this is exactly the same as above, with a bit of syntactic sugar
foo = 'is mutable'      # variables are mutable, i.e. they can vary
CONSTANTS = 'are defined like this' # they are immutable

# In addition to being object-oriented, Ruby is strongly typed
4 + 4       # => 8
4 + "foo"   # results in a TypeError
4 + 4.0     # => 8.0      this works because of type coercion
# What about this though?
def add_stuff
  4 + 4.0
end # => nil
add_stuff # => TypeError    This proves that Ruby is dynamically typed
