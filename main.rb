require 'rubocop'
require 'rubocop-performance'

def fibs(n)
  output = []

  output.push 0 if n >= 0

  output.push 1 if n >= 1

  (2...n).each do |index|
    output.push(output[index - 2] + output[index - 1])
  end

  output
end

def fibs_rec(n)
  if n == 1
    [0]
  elsif n == 2
    [0, 1]
  else
    fibs_rec(n - 1).push(fibs_rec(n - 1).last + fibs_rec(n - 2).last)
  end
end

def merge(arrA, arrB)
  output = []

  a = 0
  b = 0

  while a < arrA.length && b < arrB.length
    if arrA[a] < arrB[b]
      output.push(arrA[a])
      a += 1
    else
      output.push(arrB[b])
      b += 1
    end
  end

  while a < arrA.length
    output.push(arrA[a])
    a += 1
  end

  while b < arrB.length
    output.push(arrB[b])
    b += 1
  end

  output
end

def mergesort(arr)
  if arr.length < 2
    arr
  else
    mid = arr.length / 2
    merge(mergesort(arr[...mid]), mergesort(arr[mid..]))
  end
end

class Integer
  def num_digits
    return 1 if self == 0

    Math.log10(abs).to_i + 1
  end
end

def karatsuba(x, y)
  x_digits = x.num_digits
  y_digits = y.num_digits
  min_digits = [x_digits, y_digits].min / 2
  min_digits = 1 if min_digits == 0

  if x_digits == 1 && y_digits == 1
    x * y
  else
    x1 = x / (10**min_digits)
    y1 = y / (10**min_digits)

    x0 = x % (10**min_digits)
    y0 = y % (10**min_digits)

    z2 = karatsuba(x1, y1)
    z0 = karatsuba(x0, y0)
    z3 = karatsuba(x1 + x0, y1 + y0)
    z1 = z3 - z2 - z0

    (z2 * (10**(2 * min_digits))) + (z1 * (10**min_digits)) + z0
  end
end

puts karatsuba(522, 64)
