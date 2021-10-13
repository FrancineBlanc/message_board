require "sinatra/base"
require "sinatra/reloader"

class MessageBoard < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "Welcome to the Boards!"
  end

  run! if app_file == $0

end