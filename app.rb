require 'bundler'
Bundler.require
require 'sinatra/reloader'
require 'csv'

get '/' do
  @activities = CSV.table('datas/activity.csv')
  haml :index
end

get '/works' do
  haml :works
end
