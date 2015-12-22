#require 'json'
require 'oj'
require 'fileutils'

puts "Welcome to Lance Jordan solution to Collatz Conjecture"
puts "What is the Collatz Conjecture?"
puts "\n\r Take any natural number n. If n is even, divide it by 2 to get n / 2. If n is odd, multiply it by 3 and add 1 to obtain 3n + 1. Repeat the process (which has been called 'Half Or Triple Plus One', or HOTPO[6]) indefinitely. The conjecture is that no matter what number you start with, you will always eventually reach 1."
puts "\n\r This code will solve the highest number of steps given an integer and includes a timer function."
puts "\n\r \n\r\ Larger numbers will save to json file for faster loading later."
puts "Enter a positive integer below 1000000 : "

iterate = gets.chomp.to_i
input = iterate.to_s.to_i # create new obj so value doesn't change
start_time = Time.now
json_open = false

def json_empty?(string)
	string == "{}" || string == '' || string == nil ? true : false
end

# don't use json on smaller numbers
if input > 222200
	FileUtils.touch 'lookup.json' # insure file exsists before writing
	jsonfile = File.read('lookup.json')
	json_open = true
end

# only load json file if data exsists
if json_open && !json_empty?(jsonfile)
	#hash = JSON.parse(jsonfile)
	hash = Oj.load(jsonfile)
	puts "json loaded"
else
	hash = Hash.new
end

# filter hash key limit to user input value
@hash_limit = hash.select{|k,v| k.to_i <= input} || Hash.new

collatz = lambda do |key, this_hash|
	return this_hash[key] if this_hash[key]
	h = this_hash
	k = key
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
			if this_hash[num]
				return this_hash[key] = this_hash[num] + count
			end
		end
		h[k] = count
	end
end

def largest_hash_key
	@hash_limit.max_by{|k,v| v}
end

if !hash[input.to_s]
	while iterate > 2
		collatz.call iterate, @hash_limit
		iterate -= 1
	end
end
key = largest_hash_key[0]

if json_open && !hash[input]
	File.open("lookup.json","w") do |f|
		f.write Oj.dump(@hash_limit)
		#f.write(hash.to_json)
	end
	puts "json saved"
end

puts "number with most steps = " + key.to_s
puts "it takes #{@hash_limit[key].to_s} steps to reach zero."
puts "completed in :" + (Time.now - start_time).to_s + " seconds"
