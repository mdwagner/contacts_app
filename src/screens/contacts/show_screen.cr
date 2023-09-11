class Contacts::ShowScreen < MainScreen
  needs contact : Contact

  def append_styles
    style(
      id: "header-button",
      color: Theme.colors("blue", 600),
      fontSize: Theme.font_size("lg"),
      fontWeight: Theme.font_weight("medium"),
      padding: Theme.spacing(2)
    )
    style(
      id: "details",
      backgroundColor: Theme.colors("gray", 100),
      flex: "1",
      alignItems: "center",
      rowGap: Theme.spacing(5)
    )
    style(
      id: "contact-name",
      height: Theme.spacing(20),
      paddingHorizontal: Theme.spacing(8),
      paddingVertical: Theme.spacing(7),
      justifyContent: "center",
      fontSize: Theme.font_size("2xl"),
      fontWeight: Theme.font_weight("semibold")
    )
    style(
      id: "contact-section",
      backgroundColor: "white",
      borderWidth: "1",
      borderColor: Theme.colors("gray", 100),
      borderRadius: "10",
      width: "85%",
      height: Theme.spacing(16),
      paddingTop: Theme.spacing(2),
      paddingBottom: Theme.spacing(3),
      paddingHorizontal: Theme.spacing(3)
    )
    style(
      id: "contact-section-label",
      fontSize: Theme.font_size("sm"),
      paddingBottom: Theme.spacing(1),
      color: Theme.colors("gray", 400)
    )
    style(
      id: "contact-section-info",
      color: Theme.colors("blue", 600),
      fontSize: Theme.font_size("base"),
      fontWeight: Theme.font_weight("medium")
    )
  end

  def render_header
    text "Back", style: "header-button" do
      behavior trigger: "press", action: "back"
    end

    text "Edit", style: "header-button" do
      behavior(
        trigger: "press",
        action: "reload",
        href: Contacts::Edit.with(contact_id: contact.id).path
      )
    end
  end

  def render_content
    view style: "details" do
      text "#{contact.first} #{contact.last}", style: "contact-name"

      view "href-style": "contact-section" do
        behavior(
          "xmlns:comms": "https://hypermedia.systems/hyperview/communications",
          trigger: "press",
          action: "open-phone",
          "comms:phone-number": contact.phone || ""
        )
        text "Phone", style: "contact-section-label"
        text contact.phone || "", style: "contact-section-info"
      end

      view "href-style": "contact-section" do
        behavior(
          "xmlns:comms": "https://hypermedia.systems/hyperview/communications",
          trigger: "press",
          action: "open-email",
          "comms:email-address": contact.email
        )
        text "Email", style: "contact-section-label"
        text contact.email, style: "contact-section-info"
      end
    end
  end
end
