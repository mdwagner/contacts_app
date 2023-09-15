class Mobile::Contacts::Edit < MobileAction
  get "/mobile/contacts/:contact_id/edit" do
    contact = Contact.find_by_id!(contact_id)
    update_contact = UpdateContact.new(contact_id)

    hxml Contacts::EditScreen,
      contact: contact,
      update_contact: update_contact
  end
end
