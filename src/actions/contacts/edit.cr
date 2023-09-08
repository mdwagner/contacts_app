class Contacts::Edit < BrowserAction
  get "/contacts/:contact_id/edit" do
    contact = Contact.find_by_id!(contact_id)
    update_contact = UpdateContact.new(contact_id)

    if xml?
      hxml Contacts::EditScreen,
        contact: contact,
        update_contact: update_contact
    else
      html Contacts::EditPage,
        contact: contact,
        update_contact: update_contact
    end
  end
end
