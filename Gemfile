# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem "sinatra"
gem "sinatra-contrib"
gem "rest-client"

gem "standard", group: [:development, :test]

group :test do
  gem "rack-test"
  gem "minitest"
  gem "webmock"
end
