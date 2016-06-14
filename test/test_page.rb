require './app'
require 'test-unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'
class PageTest < Test::Unit::TestCase
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  test "static pages exist?" do
    get '/'
    assert last_response.ok?

    get '/about'
    assert last_response.ok?
  end

  test "blog page" do
    get '/blog'
    assert last_response.ok?
  end
end
