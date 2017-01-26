#require 'byebug'

#warmup
def range(start, end_num)
  return [] if end_num < start
  return [start] if start == end_num
  range(start, end_num - 1) + [end_num]
end

def sum_iterative(arr)
  sum = 0
  arr.each { |el| sum += el }
  sum
end

def sum(arr)
  return 0 if arr.empty?
  return arr.first if arr.length == 1
  sum(arr[0...-1]) + arr.last
end

#exponents
def exponent_one(b, e)
  return nil if e < 0
  return 1 if e == 0
  b * exponent_one(b, e - 1)
end

def exponent_two(b, e)
  return nil if e < 0
  return 1 if e == 0
  return b if e == 1
  if e.even?
    exponent_two(b, e / 2) ** 2
  else
    b * (exponent_two(b, (e - 1) / 2) ** 2)
  end
end

#deep dup
def deep_dup(arr)
  return arr.dup unless arr.any? { |el| el.is_a?(Array) }
  arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
end

#fib
def fib(n)
  res = [1]
  return [] if n == 0
  return res if n == 1
  res << 1 if res.length == 1
  until res.length == n
    res << res[-1] + res[-2]
  end
  res
end

def fib_recursive(n)
  return [] if n == 0
  return [1] if n == 1
  return [1, 1] if n == 2
  last_fibs = fib_recursive(n - 1)
  last_fibs + [last_fibs[-1] + last_fibs[-2]]
end

#array subsets
def subsets(arr)
  return [arr] if arr.empty?
  return [arr, []] if arr.length == 1
  res = [arr]
  arr.map.with_index do |_, i|
    small_arr = arr.dup
    small_arr.delete_at(i)
    p small_arr
    res += subsets(small_arr)
  end
  res.uniq
end

#permutations
def perms(arr)
  return [arr] if arr.length == 1
  return [arr, arr.reverse] if arr.length == 2
  res = []
  arr.each_with_index do |el, i|
    smlr = arr[0...i] + arr[i+1..-1]
    perms(smlr).each do |arr_end|
      res << [el] + arr_end
    end
  end
  res
end

#binary search
def bsearch(arr, target)
  return nil if target < arr.first
  return nil unless arr.include?(target)

  middle = arr.length/2
  midval = arr[middle]
  return middle if midval == target

  if target < midval
    bsearch(arr[0...middle], target)
  else
    middle + bsearch(arr[middle..-1], target)
  end
end

#merge sort
def msort(arr)
  return arr if arr.length < 2
  middle = arr.length/2
  midval = arr[middle]
  left = msort(arr[0...middle])
  right = msort(arr[middle..-1])
  merge(left, right)
end

def merge(left, right)
  res = []
  until left.empty? && right.empty?
    return res + right if left.empty?
    return res + left if right.empty?
    left.first < right.first ? res << left.shift : res << right.shift
  end
  res
end

#make change
def greedy(total, coin_vals)
  return [total] if coin_vals.include?(total)
  coin_vals.each do |value|
    if value < total
      return [value] + greedy(total-value, coin_vals)
    end
  end
end

#better change
def better_change(total, coin_vals)
  return [total] if coin_vals.include?(total)
  coin_vals.each_cons(2) do |vals|
    if vals[0] < total
      res = [vals[0]] + greedy(total-vals[0], coin_vals)
      other = [vals[1]] + greedy(total-vals[1], coin_vals)
      return (res.length < other.length) ? res.sort : other.sort
    end
  end
end
