require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :homepage
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url],
                  title: params[:title])
   params[:tags].split.each do |tag|

    link.tags << Tag.create(name: tag)
    end

    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.link : []
    erb :'links/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

run! if app_file == BookmarkManager

end
