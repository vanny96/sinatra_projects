#ruby web_guesser.rb
require 'sinatra'
require 'sinatra/reloader'


random_number = rand(101)

get '/' do
  erb :index, :locals => {:number => random_number}
end

