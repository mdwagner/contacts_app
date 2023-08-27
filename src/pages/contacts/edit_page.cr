class Contacts::EditPage < MainLayout
  needs contact : Contact
  needs update_contact : UpdateContact

  def content
    mount RoundedContainer do
      h2 "Update Contact", class: "text-xl font-sans font-medium mb-4 flex justify-center text-gray-700"
      div id: "update-contact-form", class: "flex flex-col items-center space-y-2" do
        div class: "w-full max-w-xs" do
          mount Shared::Field, update_contact.first do |input_tag|
            input_tag.text_input(value: attr_value(update_contact.first, contact.first))
          end
        end
        div class: "w-full max-w-xs" do
          mount Shared::Field, update_contact.last do |input_tag|
            input_tag.text_input(value: attr_value(update_contact.last, contact.last))
          end
        end
        div class: "w-full max-w-xs" do
          mount Shared::Field, update_contact.email do |input_tag|
            input_tag.email_input(
              placeholder: "you@example.com",
              value: attr_value(update_contact.email, contact.email),
              attrs: [:required]
            )
          end
        end
        div class: "w-full max-w-xs" do
          mount Shared::Field, update_contact.phone do |input_tag|
            input_tag.text_input(value: attr_value(update_contact.phone, contact.phone))
          end
        end
      end
      div class: "flex flex-col items-center mt-6" do
        button "Update", type: "button", hx_put: Contacts::Update.with(contact_id: contact.id).path, hx_target: "body", hx_include: "#update-contact-form", hx_push_url: "true",
          class: "w-24 rounded-md bg-slate-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-slate-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-slate-600 hover:cursor-pointer"
      end
    end
  end

  def attr_value(attr, value) : String
    attr.original_value || value || ""
  end
end
