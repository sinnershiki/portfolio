require 'bundler'
Bundler.require
require 'sinatra/reloader'
require 'csv'

set :username, ENV['USERNAME']
set :api_key, ENV['API_KEY']

get '/' do
  @activities = CSV.table('datas/activity.csv')
  haml :index
end

get '/about' do
  haml :about
end

get '/blog' do
  auth = Atompub::Auth::Wsse.new(username: settings.username, password: settings.api_key)
  client = Atompub::Client.new(auth: auth)
  feed = client.get_feed('https://blog.hatena.ne.jp/sinner_shiki/sinner-shiki.hatenablog.com/atom/entry')
  @entries = feed.entries.reject {|entry| entry.control.draft == "yes"}
  haml :blog
end
