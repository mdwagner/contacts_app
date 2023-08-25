class Contacts::NewPage < MainLayout
  needs create_contact : CreateContact

  def content
    mount RoundedContainer do
      form_for(Contacts::Create) do
        para do
          # TODO: turn these below into Shared::Field component
          label_for(create_contact.first)
          text_input(create_contact.first, value: create_contact.first.value || "")
          error_for(create_contact.first)
        end
        para do
          label_for(create_contact.last)
          text_input(create_contact.last, value: create_contact.last.value || "")
          error_for(create_contact.last)
        end
        para do
          label_for(create_contact.email)
          text_input(create_contact.email, value: create_contact.email.value || "")
          error_for(create_contact.email)
        end
        para do
          label_for(create_contact.phone)
          text_input(create_contact.phone, value: create_contact.phone.value || "")
          error_for(create_contact.phone)
        end
        submit "Create"
      end
    end
  end
end
