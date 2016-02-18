require 'bundler'
Bundler.require

get '/' do
  haml :index
end

get '/works' do
  haml :works
end

get '/blog' do
  haml :blog
end
