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

p mergesort([105, 79, 100, 110])
