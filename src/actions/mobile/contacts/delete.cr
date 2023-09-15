class Mobile::Contacts::Delete < MobileAction
  delete "/mobile/contacts/:contact_id" do
    DeleteContact.run(contact_id: contact_id) do |op, _|
      if op.valid?
        success_flash

        hxml_component DeleteComponent
      else
        set_flash_errors(op)

        hxml_component DeleteComponent
      end
    end
  end

  private def set_flash_errors(operation)
    if errors = operation.errors[:flash_errors]?
      flash.failure = errors.first
    end
  end

  private def success_flash
    flash.success = "Successfully deleted Contact"
  end
end
