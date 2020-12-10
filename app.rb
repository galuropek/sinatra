require 'sinatra/base'
require 'pry'

class MyApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :sessions, true

  get '/' do
    erb :index
  end

  post '/sign_in' do
    session[:current_user] = params[:login]
    binding.pry
    redirect to('/user')
  end

  get '/user' do
    @user = session[:current_user]
    binding.pry
    erb :user
  end
end