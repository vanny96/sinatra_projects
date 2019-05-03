#ruby web_platform.rb
require "sinatra"
require "sinatra/reloader" if development?
require_relative "apps/caesar-cipher/caesar-cipher"
require_relative "apps/hangman/hangman"


get "/" do
  erb :index
end

get "/caesar" do
  unless params["line"].nil?
    new_line = caesar_cipher params["line"], params["number"].to_i
  end
  erb :caesar, :locals => {:new_line => new_line}
end

game = Hangman.new

get "/hangman" do
  game.check_letter params["letter"]
  
  image = ""
  case game.counter
  when 0
    image = "/images/no_head.png"
  when 1 
    image = "/images/no_body.png"
  when 2
    image = "/images/no_arms.png"
  when 3 
    image = "/images/one_arm.png"
  when 4 
    image = "/images/no_leg.png"
  when 5 
    image = "/images/one_leg.png"
  else 6 
    image = "/images/full_body.png"
  end

  erb :hangman, :locals => {:displayed_word => game.displayed_word.join, :image => image, :counter => game.counter}
end

post "/hangman" do
  if !params["new_game"].nil?
    game = Hangman.new
    redirect "/hangman"

  elsif !params["save_game"].nil?
    game.save_game
    redirect "/hangman"

  elsif !params["load_game"].nil?
    game.load_game
    redirect "/hangman"

  else
    "Unkown Comand"
  end
end
