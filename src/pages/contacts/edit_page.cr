class Contacts::EditPage < MainLayout
  needs contact : Contact
  needs update_contact : UpdateContact

  def content
    mount RoundedContainer do
      h2 "Update Contact",
        class: "text-xl font-sans font-medium mb-4 flex justify-center text-gray-700"

      form_for(Contacts::Update.with(contact_id: contact.id), hx_boost: "true") do
        div class: "flex flex-col items-center space-y-2" do
          div class: "w-full max-w-xs" do
            render_form_field(update_contact.first) do |t|
              t.text_input value: attr_value(update_contact.first, contact.first)
            end
          end
          div class: "w-full max-w-xs" do
            render_form_field(update_contact.last) do |t|
              t.text_input value: attr_value(update_contact.last, contact.last)
            end
          end
          div class: "w-full max-w-xs" do
            render_form_field(update_contact.email) do |t|
              t.email_input(
                placeholder: "you@example.com",
                value: attr_value(update_contact.email, contact.email),
                hx_get: Contacts::Email.with(contact_id: contact.id).path,
                hx_target: %([data-field-id="#{update_contact.email.name}"]),
                hx_trigger: "input delay:200ms changed",
                attrs: [:required]
              )
            end
          end
          div class: "w-full max-w-xs" do
            render_form_field(update_contact.phone) do |t|
              t.text_input value: attr_value(update_contact.phone, contact.phone)
            end
          end
        end
        div class: "flex flex-col items-center mt-6" do
          mount PrimaryButton do |t|
            t.submit "Update"
          end
        end
      end
    end
  end

  private def attr_value(attr, value) : String
    attr.original_value || value || ""
  end

  private def render_form_field(attr, text : String? = nil, &)
    label = text || Wordsmith::Inflector.humanize(attr.name.to_s)
    label_for(attr, label, class: "block text-sm font-medium leading-6 text-gray-900")
    div class: "relative mt-1 rounded-md shadow-sm" do
      tag_defaults field: attr, class: "block w-full rounded-md border-0 py-1.5 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-300 focus:ring-2 focus:ring-inset focus:ring-gray-500 sm:text-sm sm:leading-6 invalid:text-red-600 focus:invalid:ring-red-600" do |tag_builder|
        yield tag_builder
      end
    end
    div data_field_id: attr.name.to_s do
      unless attr.valid?
        div class: "mt-2 text-sm text-red-600" do
          text "#{label} #{attr.errors.first}"
        end
      end
    end
  end
end
