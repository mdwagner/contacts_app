class Contacts::New < BrowserAction
  get "/contacts/new" do
    create_contact = CreateContact.new

    if xml?
      hxml Contacts::NewScreen, create_contact: create_contact
    else
      html Contacts::NewPage, create_contact: create_contact
    end
  end
end
