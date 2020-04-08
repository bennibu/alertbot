class Alert
  def initialize(alertmanager_payload:)
    @alertmanager_payload = alertmanager_payload
  end

  def to_telegram_message
    "[#{status}] #{alertname}: #{summary} [#{severity}]"
  end

  private

  def status
    @alertmanager_payload["status"]
  end

  def alertname
    @alertmanager_payload["commonLabels"]["alertname"]
  end

  def summary
    @alertmanager_payload["commonAnnotations"]["summary"]
  end

  def severity
    @alertmanager_payload["commonLabels"]["severity"]
  end
end
