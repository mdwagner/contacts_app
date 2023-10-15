class Mobile::PhoneBehaviorComponent < BaseHXMLComponent
  needs trigger : String = "press"
  needs phone_number : String

  def render
    behavior(
      "xmlns:comms": "https://hypermedia.systems/hyperview/communications",
      trigger: trigger,
      action: "open-phone",
      "comms:phone-number": phone_number
    )
  end
end
