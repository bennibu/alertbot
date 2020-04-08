# Alertbot

![Test](https://github.com/bennibu/alertbot/workflows/Test/badge.svg)

The Alertbot receives messages from prometheus alertmanager and sends them to a specific lists of telegram chats.

## Setup

    bundle install
    export TELEGRAM_BOT_TOKEN=123 TELEGRAM_CHAT_ID=123
    bundle exec ruby app.rb -p 4567 -e production

## Development

    bundle exec ruby test/app_test.rb
    bundle exec standardrb --fix