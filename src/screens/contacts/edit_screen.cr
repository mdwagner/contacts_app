class Contacts::EditScreen < MainScreen
  needs contact : Contact
  needs update_contact : UpdateContact

  def append_styles
    style(
      id: "header-button",
      color: Theme.colors("blue", 600),
      fontSize: Theme.font_size("lg"),
      fontWeight: Theme.font_weight("medium"),
      padding: Theme.spacing(2)
    )
  end

  def render_header
    text "Back", style: "header-button" do
      behavior trigger: "press", action: "back", href: "#"
    end
  end

  def render_content
    form do
      form_method_override(Contacts::Update.route(contact_id: contact.id))
      csrf_tag

      view id: "form-fields" do
        mount Contacts::FormFieldsComponent,
          contact: contact,
          update_contact: update_contact
      end

      view style: "button" do
        behavior(
          trigger: "press",
          action: "replace-inner",
          target: "form-fields",
          verb: form_verb(Contacts::Update.route(contact_id: contact.id)),
          href: Contacts::Update.with(contact_id: contact.id).path
        )
        text "Save", style: "button-label"
      end
    end
  end
end
