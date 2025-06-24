# input string to an array of chars
# array of chars to nums using .ord
# wrap around: a-z is 97 to 122, A-Z is 65 to 90
# if num is between 65 and 90...
# 	subtract 65 before adding shift factor?
# 	90 = 25 (26th letter, as 0th letter is A)
# 	add shift factor, then modulo 26
# 	then re-add 65
# then convert to chars using .chr
# then turn back into string using join

def caesar_cipher(input_string, shift_factor)

  chars = input_string.chars
  puts(chars)
  nums = chars.map { |char| char.ord}
  puts(nums)

  encNums = nums.map do |num|
    if num.between?(65,90)
      ((num - 65 + shift_factor) % 26) + 65
    elsif num.between?(97,122)
      ((num - 97 + shift_factor) % 26) + 97
    else 
      num
    end
  end

  encChars = encNums.map { |num| num.chr}
  encChars.join
end

puts(caesar_cipher("What a string!", 5))