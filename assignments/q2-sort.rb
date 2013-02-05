def sort(arr)
  # base case
  n = arr.length
  return arr if (n <= 1)

  # partition step
  left, right = sort(arr[0...n/2]), sort(arr[n/2...n])

  # merge step
  sorted = []
  while left.size > 0 || right.size > 0
    if right.size == 0 || (!left[0].nil? && left[0] < right[0])
      sorted.push left.shift
    else
      sorted.push right.shift
    end
  end
  sorted
end
