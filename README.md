# Alertbot

The Alertbot receives messages from prometheus alertmanager and sends them to a specific lists of telegram chats.

## Setup

    bundle install
    bundle exec ruby app.rb

## Development

    bundle exec ruby test/app_test.rb
    bundle exec standardrb --fix