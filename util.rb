def purify(input)
  punctuation   = /[.,\/#!$%\^&\*;:{}=\-_`"'~()]/ # regex for all punctuations
  input.map do |sentence|
    # remove all punctuation, special character and then downcase
    sentence.gsub(punctuation, '').downcase.strip
  end
end

def process(sentences)
  dict = {} 
  sentences.each_with_index do |sentence, index|
    words = sentence.split
    # iterate through the list of words
    words.each do |word|
      line = index + 1
      unless dict[word]
        # create new entry if word is not in out dict yet
        dict[word] = { count: 1, lines: [line] } 
      else
        # if we already have the word, 
        # increment its appearance by 1 and record which line it appears
        dict[word][:count] += 1
        dict[word][:lines] << line unless dict[word][:lines].include?(line)
      end
    end
  end
  # sort appearance in descending and word in ascending order then return
  dict.sort { |x,y| [x[1][:count], y[0]] <=> [y[1][:count],x[0]] }.reverse 
end

def display(dict)
  puts
  puts "Count\t| Word\t\t| Lines"
  puts "==============================="
  dict.each do |word, info|
    space = word.length > "word".length + 1 ? "\t" : "\t\t" # add some space for pretty output
    puts " #{info[:count]}\t| #{word}#{space}| #{info[:lines].join(" ")}" # print the output
  end
end
