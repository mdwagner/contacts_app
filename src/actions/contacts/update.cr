class Contacts::Update < BrowserAction
  put "/contacts/:contact_id" do
    UpdateContact.run(params, contact_id: contact_id) do |op, _|
      if op.valid?
        redirect Contacts::Index
      else
        # TODO: display errors
        contact = Contact.find_by_id!(contact_id)
        html Contacts::EditPage, contact: contact, op: op
      end
    end
  end
end
