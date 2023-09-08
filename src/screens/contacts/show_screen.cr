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
      alignItems: "center"
    )
    style(
      id: "contact-name",
      padding: Theme.spacing(8),
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
    style(
      id: "gap-bottom",
      marginBottom: Theme.spacing(5)
    )
  end

  def render_header
    text "Back", style: "header-button" do
      behavior trigger: "press", action: "back"
    end
  end

  def render_content
    view style: "details" do
      text "#{contact.first} #{contact.last}", style: "contact-name"

      view style: "contact-section gap-bottom" do
        text "Phone", style: "contact-section-label"
        text contact.phone || "", style: "contact-section-info"
      end

      view style: "contact-section" do
        text "Email", style: "contact-section-label"
        text contact.email, style: "contact-section-info"
      end
    end
  end
end
