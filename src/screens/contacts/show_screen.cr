class Contacts::ShowScreen < MainScreen
  needs contact : Contact

  def render_header
    text "Back", style: "header-button" do
      behavior trigger: "press", action: "back"
    end
  end

  def render_content
    view style: "details" do
      text "#{contact.first} #{contact.last}", style: "contact-name"

      view style: "contact-section" do
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
