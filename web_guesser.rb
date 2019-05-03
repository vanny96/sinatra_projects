#ruby web_guesser.rb
require 'sinatra'
require 'sinatra/reloader'


random_number = rand(101)

get '/' do
  "Number is #{random_number}"
end

