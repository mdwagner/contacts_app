class Contacts::Update < BrowserAction
  getter(contact) { Contact.find_by_id!(contact_id) }

  put "/contacts/:contact_id" do
    UpdateContact.run(params, contact_id: contact_id) do |op, _|
      if op.valid?
        if xml?
          hxml_component Contacts::FormFieldsComponent,
            contact: contact,
            update_contact: op,
            saved: true
        else
          flash.keep
          flash.success = "Successfully updated Contact"

          redirect to: Contacts::Index, status: 303
        end
      else
        if errors = op.errors[:flash_errors]?
          flash.failure = errors.first
        end

        if xml?
          hxml_component Contacts::FormFieldsComponent,
            contact: contact,
            update_contact: op
        else
          response.headers["HX-Push-Url"] = Contacts::Edit.with(contact_id: contact_id).path
          html Contacts::EditPage,
            contact: contact,
            update_contact: op
        end
      end
    end
  end
end
