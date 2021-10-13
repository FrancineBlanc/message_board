require "sinatra/base"
require "sinatra/reloader"
require "./lib/message"

class MessageBoard < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/home" do
    erb(:home)
  end

  post "/create-post" do
    @name = params[:name]
    @message = params[:message]
    Messages.create(@name, @message)
    redirect "/view-posts"
  end

  get "/view-posts" do
    @messages = Messages.show_posts
    erb(:all_posts)
  end

  run! if app_file == $0

end