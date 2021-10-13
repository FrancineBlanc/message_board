require "sinatra/base"
require "sinatra/reloader"

class MessageBoard < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/home" do
    erb(:home)
  end

  run! if app_file == $0

end