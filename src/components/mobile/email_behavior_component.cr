class Mobile::EmailBehaviorComponent < BaseHXMLComponent
  needs trigger : String = "press"
  needs email : String

  def render
    behavior(
      "xmlns:comms": "https://hypermedia.systems/hyperview/communications",
      trigger: trigger,
      action: "open-email",
      "comms:email-address": email
    )
  end
end
