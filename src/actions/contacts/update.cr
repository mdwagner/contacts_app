class Contacts::Update < BrowserAction
  put "/contacts/:contact_id" do
    UpdateContact.run(params, contact_id: contact_id) do |op, _|
      if op.valid?
        flash.keep
        flash.success = "Successfully updated Contact"
        redirect to: Contacts::Index, status: 303
      else
        if errors = op.errors[:flash_errors]?
          flash.failure = errors.first
        end
        contact = Contact.find_by_id!(contact_id)
        response.headers["HX-Push-Url"] = Contacts::Edit.with(contact_id: contact_id).path
        html Contacts::EditPage,
          contact: contact,
          update_contact: op
      end
    end
  end
end
