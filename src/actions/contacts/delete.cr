class Contacts::Delete < BrowserAction
  delete "/contacts/:contact_id" do
    DeleteContact.run(contact_id: contact_id) do |op, _|
      flash.keep
      if op.valid?
        flash.success = "Successfully deleted Contact"
      elsif errors = op.errors[:flash_errors]?
        flash.failure = errors.first
      else
        flash.failure = "Unable to delete Contact"
      end
      redirect Contacts::Index
    end
  end
end
