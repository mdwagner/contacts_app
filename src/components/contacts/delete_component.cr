class Contacts::DeleteComponent < BaseHXMLComponent
  needs flash : Lucky::FlashStore?

  def render
    view do
      hyperview_namespace

      if store = flash
        text store.failure, style: "form-flash-error"
      else
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
end
