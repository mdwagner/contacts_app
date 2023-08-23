class Contacts::Edit < BrowserAction
  get "/contacts/:contact_id/edit" do
    contact = Contact.find_by_id!(contact_id)
    update_contact = UpdateContact.new(contact_id)
    html Contacts::EditPage,
      contact: contact,
      update_contact: update_contact
  end
end
