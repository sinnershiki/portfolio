require 'bundler'
Bundler.require

get '/' do
  haml :index
end

get '/works' do
  haml :works
end
