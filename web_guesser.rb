#ruby web_guesser.rb
require 'sinatra'
require 'sinatra/reloader'

def guess_check number
  case number 
  when RANDOM_NUMBER 
    return "CORRECT!"
  when RANDOM_NUMBER..RANDOM_NUMBER+5
    return "Too high!"
  when RANDOM_NUMBER-5..RANDOM_NUMBER 
    return "Too low!"
  when 0..RANDOM_NUMBER-5
    return "Way Too low!"
  when RANDOM_NUMBER+5..100
    return "Way Too high!"
  end
end

RANDOM_NUMBER = rand(101)

get '/' do

  result = ""

  unless params['guess'].nil?
    guess = params['guess'].to_i
    result= guess_check guess
  end

  erb :index, :locals => {:result => result}
end

