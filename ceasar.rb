#ruby ceasar.rb
require "sinatra"
require "sinatra/reloader"
require_relative "ceasar-cipher"

get "/" do
  erb :index
end

get "/caesar" do
  unless params["line"].nil?
    new_line = caesar_cipher params["line"], params["number"].to_i
  end
  erb :caesar, :locals => {:new_line => new_line}
end
