
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

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id/edit' do
    @article_id = params["id"].to_i
    erb :edit
  end

  get '/articles/:id' do
    # binding.pry
    @article_id = params["id"].to_i
    erb :show
  end

  post '/articles' do
    article = Article.create(params)
    redirect to "/articles/#{article.id}"
  end

  patch '/articles/:id' do
    article = Article.find_by(id:params[:id].to_i)
    # binding.pry
    Article.update(title:params[:title], content:params[:content])
    redirect to "/articles/#{article.id}"
  end

  delete '/articles/:id' do
    Article.find_by(id:params["id"].to_i).destroy
    redirect "/articles"
  end

end
