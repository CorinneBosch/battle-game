require_relative 'lib/player'
require 'sinatra/base'
require 'sinatra/reloader'

class Battle < Sinatra::Base
  
  configure:development do 
    register Sinatra::Reloader
  end

  enable :sessions
  
  get '/' do
    erb :index
  end

  post '/names' do
    $first_player = Player.new(params[:first_player])
    # p $first_player.hp
    $second_player = Player.new(params[:second_player])
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  get '/attack' do
    erb :attack
  end

  run! if app_file == $0
end
