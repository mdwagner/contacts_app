class Contacts::EditPage < MainLayout
  needs contact : Contact
  needs op : UpdateContact

  def content
    form_for(Contacts::Update.with(contact_id: contact.id)) do
      para do
        label_for(op.first)
        text_input(op.first, value: contact.first || "")
        error_for(op.first)
      end
      para do
        label_for(op.last)
        text_input(op.last, value: contact.last || "")
        error_for(op.last)
      end
      para do
        label_for(op.email)
        text_input(op.email, value: contact.email)
        error_for(op.email)
      end
      para do
        label_for(op.phone)
        text_input(op.phone, value: contact.phone || "")
        error_for(op.phone)
      end
      submit "Update"
    end
  end

  private def error_for(field)
    mount Shared::FieldErrors, field
  end
end
