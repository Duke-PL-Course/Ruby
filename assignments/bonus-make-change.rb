def make_change(amount, coins = [25, 10, 5, 1])
  coins.sort! { |a, b| b <=> a }

  # memoize solutions
  optimal_change = Hash.new do |hash, key|
  hash[key] = if key < coins.min
  []
  elsif coins.include?(key)
  [key]
  else
  coins.
  # prune unhelpful coins
  reject { |coin| coin > key }.

  # prune coins that are factors of larger coins
  inject([]) {|mem, var| mem.any? {|c| c%var == 0} ? mem : mem+[var]}.

  # recurse
  map { |coin| [coin] + hash[key - coin] }.

  # prune unhelpful solutions
  reject { |change| change.inject {|a,b| a + b} != key }.

  # pick the smallest, empty if none
  min { |a, b| a.size <=> b.size } || []
  end
  end

  optimal_change[amount]
end

def make_change2(amount, coins = [25, 10, 5, 1])
  solutions = []
  (0...coins.size).each { |offset|
    change = []
    value = amount
    coins[offset...coins.size].each { |coin|
      until value < coin
        value -= coin
        change << coin
      end
    }
    solutions << change
  }
  solutions.min_by {|solution| solution.length }
end

p make_change(39)
p make_change(14, [10, 7, 1])
