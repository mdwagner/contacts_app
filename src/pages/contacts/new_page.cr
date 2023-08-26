class Contacts::NewPage < MainLayout
  needs create_contact : CreateContact

  def content
    mount RoundedContainer do
      h2 "Create new Contact", class: "text-xl font-sans font-medium mb-4 flex justify-center text-gray-700"
      div id: "new-contact-form", class: "flex flex-col items-center space-y-2" do
        div class: "w-full max-w-xs" do
          mount Shared::Field, create_contact.first do |input_tag|
            input_tag.text_input(value: create_contact.first.original_value || "")
          end
        end
        div class: "w-full max-w-xs" do
          mount Shared::Field, create_contact.last do |input_tag|
            input_tag.text_input(value: create_contact.last.original_value || "")
          end
        end
        div class: "w-full max-w-xs" do
          mount Shared::Field, create_contact.email do |input_tag|
            input_tag.email_input(
              placeholder: "you@example.com",
              value: create_contact.email.original_value || ""
            )
          end
        end
        div class: "w-full max-w-xs" do
          mount Shared::Field, create_contact.phone do |input_tag|
            input_tag.text_input(value: create_contact.phone.original_value || "")
          end
        end
      end
      div class: "flex flex-col items-center mt-6" do
        button "Create", type: "button", hx_post: Contacts::Create.path, hx_target: "body", hx_include: "#new-contact-form", hx_push_url: "true",
          class: "w-24 rounded-md bg-slate-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-slate-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-slate-600 hover:cursor-pointer"
      end
    end
  end
end
