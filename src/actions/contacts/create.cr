class Contacts::Create < BrowserAction
  post "/contacts" do
    CreateContact.run(params) do |op, _|
      if op.valid?
        if xml?
          success_flash

          hxml_component Contacts::NewFormFieldsComponent,
            create_contact: op,
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
          hxml_component Contacts::NewFormFieldsComponent,
            create_contact: op
        else
          response.headers["HX-Push-Url"] = Contacts::New.path
          html Contacts::NewPage, create_contact: op
        end
      end
    end
  end

  private def success_flash
    flash.success = "Successfully created Contact"
  end
end
