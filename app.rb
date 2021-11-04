require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/add' do
    erb :'bookmarks/add'
  end

  post '/add_bookmark' do
    title = params[:bookmark_title]
    url = params[:bookmark_url]
    Bookmark.create(title,url)
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
