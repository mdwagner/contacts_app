class Shared::ToastMessagesComponent < BaseHXMLComponent
  def render
    context.flash.each do |_, flash_message|
      behavior(
        "xmlns:message": "https://hypermedia.systems/hyperview/message",
        trigger: "load",
        action: "show-message",
        "message:text": flash_message
      )
    end
  end
end
