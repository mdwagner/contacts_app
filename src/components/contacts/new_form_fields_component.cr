class Contacts::NewFormFieldsComponent < BaseHXMLComponent
  needs create_contact : CreateContact
  needs saved : Bool = false

  def render
    view do
      hyperview_namespace

      if saved? && (saved_contact = saved_contact?)
        mount Shared::ToastMessagesComponent

        behavior(
          trigger: "load",
          action: "dispatch-event",
          "event-name": "contact-updated"
        )
        behavior(
          trigger: "load",
          action: "close"
        )
        behavior(
          trigger: "load",
          action: "navigate",
          href: Contacts::Show.with(contact_id: saved_contact.id).path
        )
      end

      render_form_field(create_contact.first, create_contact.first.original_value)
      render_form_field(create_contact.last, create_contact.last.original_value)
      render_form_field(create_contact.email, create_contact.email.original_value, "keyboard-type": "email-address")
      render_form_field(create_contact.phone, create_contact.phone.original_value)

      view id: "form-flash", style: "form-flash-container"
    end
  end

  def render_form_field(attr, value, **field_opts)
    label = Wordsmith::Inflector.humanize(attr.name.to_s)

    view style: "new-field-container" do
      text_field(**field_opts.merge(
        name: "#{attr.param_key}:#{attr.name}",
        placeholder: label,
        value: value || "",
        style: "new-field"
      ))
      unless attr.valid?
        text "#{label} #{attr.errors.first}", style: "new-field-error"
      end
    end
  end

  private def saved_contact?
    Contact.find_by_email?(create_contact.email.value || "")
  end
end
