# Ruby Assignment

All skeleton files are provided in the `assignments` folder. Please fork this repo to get started. For what forking means or how to fork a repo, please visit [this github help page](https://help.github.com/articles/fork-a-repo) for a detailed explanation.

Again, please feel free to post questions on [github Issues page][issues] for the repo.

Instructions for the autograder and submission will be released separately.

## Q1: Fibonacci Number (10%)

Create a function that returns the nth [Fibonacci][] number. The function should also allow the user to define the 2 seed values to begin the series
Note: n is a positive integer

```ruby
def fib(n, n1 = 1, n2 = 1)
  # ...
end
```

Example Tests:
```ruby
fib(1) # => 1
fib(6) # => 8
fib(11, 0) # => 55
```

### Hint

This function signature encourages an iterative or tail recursive solution to the problem rather than the common, head recursive solution. You might want to start with that first and then convert it to tail recursion or iteration

---

## Q2: Sorting Algorithms (10%)

Create a function that sorts an array of [comparable][] objects without using the native array.sort.

```ruby
def sort(arr)
  # ...
end
```

Example Tests:

```ruby
sort([2, 4, 1, 3]) # => [1, 2, 3, 4]
sort(['abc', 'ghi', 'def', 'a']) # => ['a', 'abc', 'def', 'ghi']
```

### Hint

Here's [a list of popular sorting algorithms][sorting] on wikipedia. Feel free to use any of them. We recommend selection sort, quick sort, or merge sort, as they often come up in coding interviews.

Remember you can use the `<=>` operator to get the result of a comparison between 2 objects of the same type

---

## Q3: Tree Implementation (15%)

Extend the Tree class in the textbook to accept a nested structure with hashes and arrays for initialization.

Example Tests:

```ruby
tree = Tree.new({
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    },
    'uncle' => {
      'child 3' => {}, 
      'child 4' => {}
    }
  }
})
```

---

## Q4: CSV Extensions (15%)

Modify the CSV application to support an each method to return a CsvRow object. Use `method_missing` on that CsvRow to return the value for the column for a given heading.

Example Test:

```ruby
lines = [
  'one, two',
  'lions, tigers'
]
csv = RubyCsv.new(lines)
csv.each {|row| puts row.one}
```

This should print "lions"

---

## Q5: Duke Classes (50%)

Implement a function that queries a collection of Duke class data using a set of criteria passed into the function.

```ruby
def queryClasses(data, criteria)
  # ...
end
```

`data` is an *array* of *hashes*. Each element in the courses array is a *hash* of course information in the form of `:field => values` where `:field` can be any arbitrary *symbol*.

`criteria` is a *hash* containing anywhere from **zero up to three** distinct operations as *keys*. The operations are:

* `:filter => { :key => {:operator => :operand}, ... }`: the associated value is a *hash* of clauses. Each clause is a pairing of a `:symbol`, corresponding to a *data field*, to a *hash of logic operations*. The *logic operations* for each clause are combined using **logical and**. All clauses are combined using **logical and** as well to construct the filter. Only elements that satisfy **ALL** of the filter clauses should be included in the output. If the filter hash is empty or this operation is not included in `criteria`, leave all input elements. If a field for a course does not exist but a filter is specified, that course should not be included in the output (unless you're expliciting using the `:exists` filter. All the possible *logic operations* are listed below:

    * `{ :gt => value }`: greater than `value`
    * `{ :gte => value }`: greater than or equal to `value`
    * `{ :lt => value }`: less than `value`
    * `{ :lte => value }`: less than or equal to `value`
    * `{ :eq => value }`: equal to `value`
    * `{ :neq => value }`: not equal to `value`
    * `{ :exists => value }`: exists(if value = `true`) or doesn't exist (if value = `false`)

* `:select => [ ... ]`: the associated value is an *array* of symbols. Each element in the output must only contain fields specified in this list and nothing more. If this array is empty, or this operation is not included in `criteria`, output all fields. If a particular field in a course does not exist, simply omit that key-value pair from the output for that course.
* `:sort_by => :field`: the associated value is an symbol corresponding by a field to sort by. The order of the *output elements* should be determined by comparing the field specified *in order*. If this operation is not included in `criteria`, use the input order. If any courses in the data set do not have the given field, then move them to the end of the output, but maintain stability (i.e. even though they've moved to the end, maintain their original, relative order).
* `:limit => n`: the associated value is a nonnegative, integer number, `n`. Limit the *output* to contain up to the first `n` elements. If `n` is `0`, or this operations is not included in `criteria`, don't limit the output.


Example Test:

```ruby
data = [{
  :department => 'CS',
  :number => 101,
  :name => 'Intro to Computer Science',
  :credits => 1.00
}, {
  :department => 'CS',
  :number => 82,
  :name => 'The Internet Seminar',
  :credits => 0.5
}, {
  :department => 'ECE',
  :number => 52,
  :name => 'Intro to Digital Logic'
  # Note that the :credits key-value pair is missing
}]
criteria = {
  :filter => {
    :number => {
      :gt => 80
    },
    :credits => {
      :gte => 0.5
    }
  },
  :select => [:number, :name],
  :sort_by => :number
}

queryClasses(data, criteria)
```

Expected Output:

```ruby
[{
  :number => 82,
  :name => 'The Internet Seminar'
}, {
  :number => 101,
  :name => 'Intro to Computer Science'
}]
```

*Note*: The order of the keys within the each course do not matter

### Hint
* the suggested order of operations is `:filter` > `:sort_by` > `:limit` > `:select`
* the actual structure of the data elements don't matter. the function should work as long as the data and queries are both valid and the corresponding fields are of the same type, which we guarantee to be true
* definitely consider using enumerable methods with blocks. Otherwise, your solution maybe unnecessarily verbose and complex
* make use of the `<=>` operator for comparisions

### Note
We created this problem as a more ambitious and challenging problem to exercise the collection and functional parts of the Ruby language. This will prepare you for many of the languages to come.

The query format we have selected here is very similar to that of [Mongodb][], which is a very popular [NoSQL][] database system for storing flexible [JSON][] documents. You should feel good after completing this problem, as you have just created the core of a simple yet powerful querying engine.

---

## Bonus: Making Change (+50%)

Write a function to return the optimal change with the least number of coins. `coins` array can also be passed in to change the available denominations. You can assume you have an infinite number of coins to work with.

```ruby
def make_change(amount, coins = [25, 10, 5, 1])
  # ...
end
```

Example Test:
```ruby
make_change(39) #=> [25, 10, 1, 1, 1, 1]
```

### Hint

At first glance, a [greedy][] approach seems to be the solution to this problem. However, the following example illustrates that sometimes the greedy approach will produce suboptimal solutions:

```ruby
make_change(14, [10, 7, 1]) 
# greedy solution: [10, 1, 1, 1, 1]
# optimal solution: [7, 7]
```

As a result, [dynamic programming][dynamic] or other approaches are needed to solve the problem. 

### Note

We picked this problem because both of us have been asked this question during technical interviews. The algorithm concepts mentioned here is well beyond the scope of this course. However, you are more than welcome to attempt and we are always happy to help.

<!-- Links -->

[comparable]: http://www.ruby-doc.org/core-1.9.3/Comparable.html
[Fibonacci]: http://en.wikipedia.org/wiki/Fibonacci_number
[sorting]: http://en.wikipedia.org/wiki/Sorting_algorithm#Summaries_of_popular_sorting_algorithms
[greedy]: http://en.wikipedia.org/wiki/Greedy_algorithm
[dynamic]: http://en.wikipedia.org/wiki/Dynamic_programming
[Mongodb]: http://www.mongodb.org/
[NoSQL]: http://en.wikipedia.org/wiki/NoSQL
[JSON]: http://en.wikipedia.org/wiki/JSON
[issues]: https://github.com/Duke-PL-Course/Ruby/issues?state=open
