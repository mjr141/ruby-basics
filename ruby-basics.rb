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

# puts(substrings("Howdy partner, sit down! How's it going?", dictionary_example))

def stock_picker (prices)
  days = []
  profit = nil

  prices.each_with_index do |buy_price, buy_day|
    remaining = prices.slice((buy_day+1)..)
    sell_price = remaining.max

    if sell_price != nil
      sell_day = remaining.index(sell_price) + buy_day + 1

      if (profit == nil) || (sell_price - buy_price) > profit
        profit = sell_price - buy_price
        days = [buy_day, sell_day]
      end
    end
  end

  puts("#{days} for a profit of $#{prices[days[1]]} - $#{prices[days[0]]} = $#{profit}")
  return days
end

# puts(stock_picker([17,3,6,1,16,8,6,1,0]))

def bubble_sort (array)
  # condition for entering the loop
  swapped = true
  puts("#{array}")

  while swapped == true
    # we'll exit the loop if the array is sorted
    swapped = false
    array.each_with_index do |element, index|
      next_element = array[index + 1]
      if next_element != nil
        if element > next_element
          array[index], array[index+1] = array[index+1], array[index]
          puts("#{array}")
          swapped = true
        end
      end
    end
  end
  return array
end

puts(bubble_sort([4,3,78,2,0,2]))