class Contacts::EditFormFieldsComponent < BaseHXMLComponent
  needs contact : Contact
  needs update_contact : UpdateContact
  needs saved : Bool = false

  def render
    view do
      hyperview_namespace

      if saved?
        mount Shared::ToastMessagesComponent

        behavior(
          trigger: "load",
          action: "dispatch-event",
          "event-name": "contact-updated"
        )
        behavior(
          trigger: "load",
          action: "reload",
          href: Contacts::Show.with(contact_id: contact.id).path
        )
      end

      render_form_field(update_contact.first, contact.first)
      render_form_field(update_contact.last, contact.last)
      render_form_field(update_contact.email, contact.email, "keyboard-type": "email-address")
      render_form_field(update_contact.phone, contact.phone)

      view id: "form-flash", style: "form-flash-container"
    end
  end

  def render_form_field(attr, value, **field_opts)
    label = Wordsmith::Inflector.humanize(attr.name.to_s)

    view style: "edit-field-container" do
      text_field(**field_opts.merge(
        name: "#{attr.param_key}:#{attr.name}",
        placeholder: label,
        value: value || "",
        style: "edit-field"
      ))
      unless attr.valid?
        text "#{label} #{attr.errors.first}", style: "edit-field-error"
      end
    end
  end
end
