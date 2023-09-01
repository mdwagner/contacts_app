class Contacts::Email < BrowserAction
  get "/contacts/:contact_id/email" do
    email = params.from_query["update_contact:email"]? || ""
    email = email.downcase

    if email_valid?(email)
      plain_text ""
    else
      component EmailErrorComponent, email: email
    end
  end

  private def email_valid?(email)
    if contact = Contact.find_by_id?(contact_id)
      if contact_w_email = Contact.find_by_email?(email)
        unless contact_w_email.id == contact.id
          return false
        end
      end
    end
    true
  end
end
