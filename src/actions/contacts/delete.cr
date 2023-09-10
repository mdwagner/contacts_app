class Contacts::Delete < BrowserAction
  delete "/contacts/:contact_id" do
    DeleteContact.run(contact_id: contact_id) do |op, _|
      if op.valid?
        if xml?
          success_flash

          hxml_component Contacts::DeleteComponent
        else
          flash.keep
          success_flash

          redirect to: Contacts::Index, status: 303
        end
      else
        if xml?
          set_flash_errors(op)

          hxml_component Contacts::DeleteComponent
        else
          flash.keep
          set_flash_errors(op)

          redirect to: Contacts::Index, status: 303
        end
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
