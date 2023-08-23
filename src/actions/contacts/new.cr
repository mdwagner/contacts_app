class Contacts::New < BrowserAction
  get "/contacts/new" do
    create_contact = CreateContact.new
    html Contacts::NewPage, create_contact: create_contact
  end
end
