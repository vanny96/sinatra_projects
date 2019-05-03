require 'csv'
require 'yaml'


class Hangman
	attr_accessor :word, :counter, :displayed_word

	def initialize
		@word = choose_word
		@displayed_word = []
		@counter = -1
		@word.length.times do
			@displayed_word << "_ "
		end 
	end

	def choose_word
  	dictionary = CSV.open("apps/hangman/words.txt").read
  	word = ""
  	until word.length > 4 && word.length < 13
			word = dictionary[rand(dictionary.length)][0].downcase
		end
	
		word
	end

	def check_letter letter
		right_letters = (0..@word.length).select do |index| 
			@word[index] == letter
		end
		@counter += 1 if right_letters.length == 0
		right_letters.each do |index|
			@displayed_word[index] = letter   
		end  
	end

	#Serialization code
	def save_game
	  data = {word: @word, displayed_word: @displayed_word, counter: @counter}
		file = File.open 'savegame.yml', 'w'
		file.puts YAML.dump(data)
		file.close
	end
	def load_game
		data = YAML.load(File.open('savegame.yml'))
		@word = data[:word]
		@displayed_word = data[:displayed_word]
		@counter = data[:counter]
	end
end



