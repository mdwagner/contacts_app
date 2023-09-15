class Mobile::Contacts::Create < MobileAction
  post "/mobile/contacts" do
    CreateContact.run(params) do |op, _|
      if op.valid?
        success_flash

        hxml_component NewFormFieldsComponent,
          create_contact: op,
          saved: true
      else
        if errors = op.errors[:flash_errors]?
          flash.failure = errors.first
        end

        hxml_component NewFormFieldsComponent,
          create_contact: op
      end
    end
  end

  private def success_flash
    flash.success = "Successfully created Contact"
  end
end
