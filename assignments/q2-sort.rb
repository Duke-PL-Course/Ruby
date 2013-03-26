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

def selectionSort(arr)
  arr.each_with_index {|value, index|
    rest = arr[index...arr.size]
    min = rest.min
    minIndex = rest.index(min) + index

    if not minIndex.nil?
      arr[index] = min
      arr[minIndex] = value
    end
  }
end

def merge(left, right)
  result = []
  while left.size > 0 and right.size > 0
    a, b = left.first, right.first
    result.push(a < b ? left.shift : right.shift)
  end
  result + left + right
end

def mergeSort(arr)
  return arr if arr.size <= 1

  middleIndex = arr.size/2
  left = arr[0...middleIndex]
  right = arr[middleIndex...arr.size]

  merge(mergeSort(left), mergeSort(right))
end


def quickSort(arr)
  return arr if arr.size <= 1

  pivot = arr.delete_at(arr.size/2)

  less, greater = [], []
  arr.each {|n|
    less << n if n <= pivot
    greater << n if n > pivot
  }

  quickSort(less) + [pivot] + quickSort(greater)
end

def bubbleSort(arr)
  begin
    swapCount = 0

    for i in 0...(arr.size - 1)
      a, b = arr[i], arr[i + 1]
      if a > b
        arr[i], arr[i + 1] = b, a
        swapCount += 1
      end
    end

  end while swapCount > 0
  arr
end
