require_relative 'model/task'
require 'sinatra/base'
require 'pry'

class MyApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :sessions, true

  before do
    @task = Task.new('my task')
  end

  get '/' do
    erb :index
  end

  post '/sign_in' do
    session[:current_user] = params[:login]

    redirect to('/user')
  end

  get '/user' do
    @user = session[:current_user]

    erb :user
  end

  get '/start_stopwatch' do
    @task.start_stopwatch
    binding.pry
    redirect to('/')
  end
end
