# Alertbot

The Alertbot receives messages from prometheus alertmanager and sends them to a specific lists of telegram chats.

## Setup

    bundle install
    bundle exec ruby app.rb -p 4567 -e production

## Development

    bundle exec ruby test/app_test.rb
    bundle exec standardrb --fix