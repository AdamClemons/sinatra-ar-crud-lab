
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article_id = params[:id].to_i
    erb :show
  end

  get 'articles/new' do
    erb :new
  end

  post '/articles' do
    binding.pry
    article = Article.create(title: params[:title], content: params[:content])
    article
    erb :show    
  end

end
