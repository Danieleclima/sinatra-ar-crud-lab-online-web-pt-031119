
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do
    erb :new
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  post '/articles' do
   @article = Article.create(params)
   redirect '/articles/'
   erb :show
  end
  
  get '/articles' do
    @article = Article.all
    erb :index
  end
  
  get '/articles/:id/edit' do
    erb :edit
  end
end
