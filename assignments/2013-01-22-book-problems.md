## Day 1
* Print the string "Hello, World"
* For the string “Hello, Ruby,” find the index of the word “Ruby.”
* Print your name 10 times
* Print the string "This is sentence number 1," where the number 1 changes from 1 to 10.
* Run a Ruby program from a file
* Bonus problem: write a program that picks a random number. Let a player guess the number, telling the player whether the guess is too low or too high.

## Day 2
* Print the contents of an array of sixteen numbers, four numbers at a time, using just each. Now, do the same with each_slice in Enumerable.
* The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure with hashes and arrays. You should be able to specify a tree like this: `{’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }`.
* Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a simple regular expression match and read lines from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers.

## Day 3
Modify the CSV application to support an each method to return a CsvRow object. Use `method_missing` on that CsvRow to return the value for the column for a given heading.
For example, for the file:

    one, two
    lions, tigers

allow an API that works like this:

    csv = RubyCsv.new
    csv.each {|row| puts row.one}
    
This should print "lions"