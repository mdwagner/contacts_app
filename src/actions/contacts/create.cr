class Contacts::Create < BrowserAction
  post "/contacts" do
    CreateContact.run(params) do |op, _|
      if op.valid?
        flash.success = "Successfully created Contact"
        redirect Contacts::Index
      else
        if errors = op.errors[:flash_errors]?
          flash.failure = errors.first
        end
        html Contacts::NewPage, create_contact: op
      end
    end
  end
end
