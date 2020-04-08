require File.expand_path "../test_helper.rb", __FILE__

class MyTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_routing_alerts_to_telegram
    stub_request(:any, "https://api.telegram.org/bot123/sendMessage")

    post "/alerts", default_alertmanager_payload.to_json,
      {"CONTENT_TYPE" => "application/json"}

    assert last_response.status, 201

    assert_requested :post, "https://api.telegram.org/bot123/sendMessage",
      headers: {"Content-Type" => "application/json"},
      body: {
        chat_id: "456",
        text: "[firing] jitsi-meet: High latency is high! [warning]"
      }.to_json,
      times: 1
  end

  private

  def default_alertmanager_payload
    {
      "receiver" => "alertbot",
      "status" => "firing",
      "alerts" => [
        {
          "status" => "firing",
          "labels" => {
            "alertname" => "jitsi-meet",
            "instance" => "jitsi-meet.example.net",
            "service" => "my-service",
            "severity" => "warning"
          },
          "annotations" => {
            "summary" => "High latency is high!"
          },
          "startsAt" => "2020-04-08T22:17:44.4416179+02:00",
          "endsAt" => "0001-01-01T00:00:00Z",
          "generatorURL" => "http://prometheus.int.example.net/<generating_expression>",
          "fingerprint" => "df0899306627e65c"
        }
      ],
      "groupLabels" => {
        "alertname" => "jitsi-meet"
      },
      "commonLabels" => {
        "alertname" => "jitsi-meet",
        "instance" => "jitsi-meet.example.net",
        "service" => "my-service",
        "severity" => "warning"
      },
      "commonAnnotations" => {
        "summary" => "High latency is high!"
      },
      "externalURL" => "http://localhost:9093",
      "version" => "4",
      "groupKey" => "{}:{alertname=\"jitsi-meet\"}"
    }
  end
end
