class Contacts::Update < BrowserAction
  put "/contacts/:contact_id" do
    UpdateContact.run(params, contact_id: contact_id) do |op, _|
      if op.valid?
        flash.success = "Successfully updated Contact"
        redirect Contacts::Index
      else
        if errors = op.errors[:flash_errors]?
          flash.failure = errors.first
        end
        contact = Contact.find_by_id!(contact_id)
        html Contacts::EditPage,
          contact: contact,
          update_contact: op
      end
    end
  end
end
