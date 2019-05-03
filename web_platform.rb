#ruby web_platform.rb
require "sinatra"
require "sinatra/reloader"
require "csv"
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
  erb :hangman, :locals => {:word => game.word, :displayed_word => game.displayed_word.join, :counter => game.counter}
end

post "/hangman" do
  game = Hangman.new
  redirect "/hangman"
end
