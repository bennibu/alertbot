require "rest-client"

class TelegramGateway
  def post_message(text:)
    RestClient.post send_message_url,
      {
        chat_id: ENV.fetch("TELEGRAM_CHAT_ID"),
        text: text
      }.to_json,
      {content_type: :json, accept: :json}
  end

  private

  def send_message_url
    "https://api.telegram.org/bot#{ENV.fetch("TELEGRAM_BOT_TOKEN")}/sendMessage"
  end
end
