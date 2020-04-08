ENV["RACK_ENV"] = "test"
ENV["TELEGRAM_BOT_TOKEN"] = "123"
ENV["TELEGRAM_CHAT_ID"] = "456"

require "minitest/autorun"
require "rack/test"
require "webmock/minitest"

require File.expand_path "../../app.rb", __FILE__
