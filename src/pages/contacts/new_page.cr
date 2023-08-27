class Contacts::NewPage < MainLayout
  needs create_contact : CreateContact

  def content
    mount RoundedContainer do
      h2 "Create new Contact", class: "text-xl font-sans font-medium mb-4 flex justify-center text-gray-700"
      div id: "new-contact-form", class: "flex flex-col items-center space-y-2" do
        div class: "w-full max-w-xs" do
          mount FormField, create_contact.first do |t|
            t.text_input value: create_contact.first.original_value || ""
          end
        end
        div class: "w-full max-w-xs" do
          mount FormField, create_contact.last do |t|
            t.text_input value: create_contact.last.original_value || ""
          end
        end
        div class: "w-full max-w-xs" do
          mount FormField, create_contact.email do |t|
            t.email_input(
              placeholder: "you@example.com",
              value: create_contact.email.original_value || "",
              attrs: [:required]
            )
          end
        end
        div class: "w-full max-w-xs" do
          mount FormField, create_contact.phone do |t|
            t.text_input value: create_contact.phone.original_value || ""
          end
        end
      end
      div class: "flex flex-col items-center mt-6" do
        mount UI::PrimaryButton do |t|
          t.button "Create",
            type: "button",
            hx_post: Contacts::Create.path,
            hx_target: "body",
            hx_include: "#new-contact-form",
            hx_push_url: "true"
        end
      end
    end
  end
end
