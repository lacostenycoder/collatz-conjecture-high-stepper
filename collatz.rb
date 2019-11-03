#!/usr/bin/env ruby
puts File.read('./intro.txt')
puts "\nEnter a positive integer below 1000000 : "
iterate = gets.chomp.to_i
start_time = Time.now

@hash = Hash.new do |h, k|
  if k < 2
    h[k] = 1
  else
    count = 0
    num = k
    while num > 1
      if num.even?# % 2 == 0
        num /= 2
      else
        num = num * 3 + 1
      end
      count += 1
    end
    h[k] = count
  end
end

def largest_hash_key
  @hash.max_by{|k,v| v}
end

while iterate > 0
  @hash[iterate]
  iterate -= 1
end

high_number = largest_hash_key[0]

puts "number with most steps = #{high_number}"
puts "it takes #{@hash[high_number] + 1} steps to reach zero."
puts "completed in : #{(Time.now - start_time).to_s} seconds"
