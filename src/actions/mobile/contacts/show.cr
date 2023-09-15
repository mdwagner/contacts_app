class Mobile::Contacts::Show < MobileAction
  get "/mobile/contacts/:contact_id" do
    contact = Contact.find_by_id!(contact_id)
    hxml Contacts::ShowScreen, contact: contact
  end
end
