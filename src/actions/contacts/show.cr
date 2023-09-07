class Contacts::Show < BrowserAction
  get "/contacts/:contact_id" do
    contact = Contact.find_by_id!(contact_id)
    hxml Contacts::ShowScreen, contact: contact
  end
end
