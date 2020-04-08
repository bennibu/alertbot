require "sinatra"
require "sinatra/custom_logger"
require "logger"
require_relative "alert"
require_relative "telegram_gateway"

$stdout.sync = true # Disable log buffering

set :logger, Logger.new(STDOUT)

post "/alerts" do
  data = JSON.parse(request.body.read)
  logger.info "Received alert: #{data}"

  message = Alert.new(alertmanager_payload: data).to_telegram_message

  TelegramGateway.new.post_message(text: message)
  status 201
end
