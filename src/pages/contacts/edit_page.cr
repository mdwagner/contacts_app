class Contacts::EditPage < MainLayout
  needs contact : Contact
  needs update_contact : UpdateContact

  def content
    form_for(Contacts::Update.with(contact_id: contact.id)) do
      para do
        label_for(update_contact.first)
        text_input(update_contact.first, value: contact.first || "")
        error_for(update_contact.first)
      end
      para do
        label_for(update_contact.last)
        text_input(update_contact.last, value: contact.last || "")
        error_for(update_contact.last)
      end
      para do
        label_for(update_contact.email)
        text_input(update_contact.email, value: contact.email)
        error_for(update_contact.email)
      end
      para do
        label_for(update_contact.phone)
        text_input(update_contact.phone, value: contact.phone || "")
        error_for(update_contact.phone)
      end
      submit "Update"
    end
  end
end
