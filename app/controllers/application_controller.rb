
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
    @article_id = params[:id].to_i
    erb :edit
  end

  get '/articles/:id' do
    @article_id = params[:id].to_i
    erb :show
  end

  post '/articles' do
    article = Article.create(params)
    redirect to "/articles/#{article.id}"
  end

  get '/articles/:id/edit' do
    @article_id = params[:id].to_i
    erb :edit
  end

  patch '/articles/:id' do
    article = Article.find_by(id:params[:id].to_i)
    Article.update(title:params[:title], content:params[:content])
  end

end
