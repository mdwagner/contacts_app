class Contacts::FormFieldsComponent < BaseHXMLComponent
  needs contact : Contact
  needs update_contact : UpdateContact

  def render
    view style: "edit-group" do
      render_form_field(update_contact.first, contact.first)
      render_form_field(update_contact.last, contact.last)
      render_form_field(update_contact.email, contact.email)
      render_form_field(update_contact.phone, contact.phone)
    end
  end

  def render_form_field(attr, value)
    label = Wordsmith::Inflector.humanize(attr.name.to_s)

    view style: "edit-field" do
      text_field(
        name: "#{attr.param_key}:#{attr.name}",
        placeholder: label,
        value: value || ""
      )
      unless attr.valid?
        text "#{label} #{attr.errors.first}", style: "edit-field-error"
      end
    end
  end
end
