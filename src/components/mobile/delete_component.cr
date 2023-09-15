class Mobile::DeleteComponent < BaseHXMLComponent
  def render
    view do
      hyperview_namespace

      mount Shared::ToastMessagesComponent

      behavior(
        trigger: "load",
        action: "dispatch-event",
        "event-name": "contact-updated"
      )
      behavior(
        trigger: "load",
        action: "back",
      )
    end
  end
end
