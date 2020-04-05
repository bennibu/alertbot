ENV["APP_ENV"] = "test"

require_relative "../app"
require "test/unit"
require "rack/test"

class HelloWorldTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_says_hello_world
    get "/"
    assert last_response.ok?
    assert_equal "Hello world!", last_response.body
  end
end
