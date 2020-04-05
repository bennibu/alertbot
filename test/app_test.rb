require File.expand_path "../test_helper.rb", __FILE__

class MyTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_receiving_alerts
    post "/alerts", {
      "status" => "firing"
    }.to_json,
      {"CONTENT_TYPE" => "application/json"}

    assert last_response.status, 201
  end
end
