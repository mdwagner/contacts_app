class Contacts::EditPage < MainLayout
  needs contact : Contact
  needs update_contact : UpdateContact

  def content
    mount RoundedContainer do
      h2 "Update Contact", class: "text-xl font-sans font-medium mb-4 flex justify-center text-gray-700"
      div id: "update-contact-form", class: "flex flex-col items-center space-y-2" do
        div class: "w-full max-w-xs" do
          mount FormField, update_contact.first do |t|
            t.text_input value: attr_value(update_contact.first, contact.first)
          end
        end
        div class: "w-full max-w-xs" do
          mount FormField, update_contact.last do |t|
            t.text_input value: attr_value(update_contact.last, contact.last)
          end
        end
        div class: "w-full max-w-xs" do
          mount FormField, update_contact.email do |t|
            t.email_input(
              placeholder: "you@example.com",
              value: attr_value(update_contact.email, contact.email),
              attrs: [:required]
            )
          end
        end
        div class: "w-full max-w-xs" do
          mount FormField, update_contact.phone do |t|
            t.text_input value: attr_value(update_contact.phone, contact.phone)
          end
        end
      end
      div class: "flex flex-col items-center mt-6" do
        mount UI::PrimaryButton do |t|
          t.button "Update",
            type: "button",
            hx_put: Contacts::Update.with(contact_id: contact.id).path,
            hx_target: "body",
            hx_include: "#update-contact-form",
            hx_push_url: "true"
        end
      end
    end
  end

  private def attr_value(attr, value) : String
    attr.original_value || value || ""
  end
end
