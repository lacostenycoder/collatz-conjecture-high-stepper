puts "Welcome to Lance Jordan solution to Collatz Conjecture"
puts "What is the Collatz Conjecture?"
puts "\n\r Take any natural number n. If n is even, divide it by 2 to get n / 2. If n is odd, multiply it by 3 and add 1 to obtain 3n + 1. Repeat the process (which has been called 'Half Or Triple Plus One', or HOTPO[6]) indefinitely. The conjecture is that no matter what number you start with, you will always eventually reach 1."
puts "\n\r This code will solve the highest number of steps given an integer and includes a timer function."

puts "Enter a positive integer below 1000000 : "

iterate = gets.chomp.to_i

start_time = Time.now
collatz = Hash.new{ |h,k|
	if k < 2
		h[k] = k
	else
		count = 0
		num = k
		while num > 1
			if num % 2 == 0
				num = num / 2
			else
				num = num * 3 + 1			
			end
			count += 1
		end	
		h[k] = count
	end
}

def largest_hash_key(hash)
	hash.max_by{|k,v| v}
end

while iterate > 2
	collatz[iterate]
	iterate -= 1
end	

key = largest_hash_key(collatz)[0]

puts "number with most steps = " + largest_hash_key(collatz)[0].to_s
puts "it takes #{collatz[key].to_s} steps to reach zero."
puts "completed in :" + (Time.now - start_time).to_s + " seconds"
