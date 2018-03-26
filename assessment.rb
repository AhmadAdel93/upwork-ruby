# @param {Integer[][]} grid
# @return {Integer}
def main
  puts "Longest sum of consecutive primes : #{consecutive_sum(1000000)}"
end

def consecutive_sum(max_limit)
  sum = 0
  next_prime = 2
  stack = []
  while(sum+next_prime < max_limit)
    # puts "curr prime : #{next_prime}"
    # puts "size : #{stack.length}"
    sum += next_prime
    stack << next_prime
    next_prime = get_next_prime(next_prime,max_limit)
    # puts "next_prime #{next_prime}"
  end
  # puts stack.inspect
  # puts sum
  left_sum = sum
  right_sum = sum
  i = 0
  j = stack.length-1

  while !is_prime(left_sum) && i < stack.length do
    left_sum -= stack[i]
    i += 1
  end

  while !is_prime(right_sum) && j >= 0 do
    right_sum -= stack[j]
    j -= 1
  end
  # puts "left : #{left_sum} right: #{right_sum} i: #{i} j: #{j}"

  i<(stack.length - 1 - j) ? left_sum : right_sum
end

def get_next_prime(x,max)
  for i in x+1..max
   if !i.even? && (is_prime(i))
    return i 
   end
  end
  i
end

def is_prime(num)
  # puts "checking #{num}"
  if num <= 3
      return true
  elsif num%2 == 0 || num%3 == 0
      return false
  end
  i = 5
  # puts "sqrt : #{Math.sqrt(num)}"
  while i <= Math.sqrt(num) do
    if num%i == 0
      return false 
    end
    i += 1
  end
  # for i in 5..100
  #     if num%i == 0
  #        return false 
  #     end
  # end
  
  return true
end

main