class Mobile::Contacts::New < MobileAction
  get "/mobile/contacts/new" do
    create_contact = CreateContact.new
    hxml Contacts::NewScreen, create_contact: create_contact
  end
end
