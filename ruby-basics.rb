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

def caesar_cipher (input_string, shift_factor)

  chars = input_string.chars
  # puts(chars)
  nums = chars.map { |char| char.ord}
  # puts(nums)

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

# puts(caesar_cipher("What a string!", 5))

# turn word to lowercase (#downcase)
# turn word to array (try #split with ' ' delimiter)
# count num of substrings in array (#count and #include?)
# if count > 0, add or update hash with key (substring) and count. simple!
dictionary_example = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
def substrings (phrase, dictionary)
  phrase_array = phrase.downcase.split(' ')
  hash = {}

  dictionary.each do |dic_word|
    curr_count = phrase_array.count { |phr_word| phr_word.include?(dic_word) }
    if curr_count > 0
      hash.store(dic_word, curr_count)
    end
  end

  if hash.empty?
    return nil
  else
    return hash
  end
end

puts(substrings("below", dictionary_example))