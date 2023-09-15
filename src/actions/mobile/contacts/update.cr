class Mobile::Contacts::Update < MobileAction
  getter(contact) { Contact.find_by_id!(contact_id) }

  post "/mobile/contacts/:contact_id/update" do
    UpdateContact.run(params, contact_id: contact_id) do |op, _|
      if op.valid?
        success_flash

        hxml_component EditFormFieldsComponent,
          contact: contact,
          update_contact: op,
          saved: true
      else
        if errors = op.errors[:flash_errors]?
          flash.failure = errors.first
        end

        hxml_component EditFormFieldsComponent,
          contact: contact,
          update_contact: op
      end
    end
  end

  private def success_flash
    flash.success = "Successfully updated Contact"
  end
end
