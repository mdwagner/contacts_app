class Contacts::Update < BrowserAction
  getter(contact) { Contact.find_by_id!(contact_id) }

  put "/contacts/:contact_id" do
    UpdateContact.run(params, contact_id: contact_id) do |op, _|
      if op.valid?
        if xml?
          success_flash

          hxml_component Contacts::EditFormFieldsComponent,
            contact: contact,
            update_contact: op,
            saved: true
        else
          flash.keep
          success_flash

          redirect to: Contacts::Index, status: 303
        end
      else
        if errors = op.errors[:flash_errors]?
          flash.failure = errors.first
        end

        if xml?
          hxml_component Contacts::EditFormFieldsComponent,
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

  private def success_flash
    flash.success = "Successfully updated Contact"
  end
end
