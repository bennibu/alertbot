require "sinatra"
require 'sinatra/custom_logger'
require 'logger'

set :logger, Logger.new(STDOUT)

post "/alerts" do
  data = JSON.parse request.body.read
  # TODO: Send message to telegram ...
  logger.info "Received message with payload: #{data}"
  status 201
end
