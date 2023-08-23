class Contacts::Edit < BrowserAction
  get "/contacts/:contact_id/edit" do
    contact = Contact.find_by_id!(contact_id)
    op = UpdateContact.new(contact_id)
    html Contacts::EditPage, contact: contact, op: op
  end
end
