require_relative 'model/task'
require 'sinatra/base'
require 'pry'

class MyApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :sessions, true

  get '/' do
    @task = session[:task]

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
    session[:task].start_stopwatch

    redirect to('/')
  end

  get '/stop_stopwatch' do
    session[:task].stop_stopwatch

    redirect to('/')
  end

  get '/create_task' do
    session[:task] = Task.new('my task')

    redirect to('/')
  end
end
