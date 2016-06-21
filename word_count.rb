require_relative 'util'

print "Enter file name: "
filename = gets.chomp # Get input from user

begin 
  # Open file to read
  file = open(filename, 'r')
  # Read file contents
  contents   = file.readlines
  # Strip down all punctuations and downcase all words
  sentences  = purify(contents)
  # Map input to a hash table contains each word as key, 
  # numbers of appearance and lines it appears as value
  # format: { "word" => { count: 1, lines: [1, 2] }
  dictionary = process(sentences)
  # Show what we get
  display(dictionary)
rescue Exception => e
  # Handle exception in case file does not exist
  p e.message
ensure
  # Make sure file always get closed after opening 
  file.close unless file.nil?
end
