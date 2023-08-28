class Contacts::NewPage < MainLayout
  needs create_contact : CreateContact

  def content
    mount RoundedContainer do
      h2 "Create new Contact",
        class: "text-xl font-sans font-medium mb-4 flex justify-center text-gray-700"

      form_for(Contacts::Create, hx_boost: "true") do
        div class: "flex flex-col items-center space-y-2" do
          div class: "w-full max-w-xs" do
            render_form_field(create_contact.first) do |t|
              t.text_input value: create_contact.first.original_value || ""
            end
          end
          div class: "w-full max-w-xs" do
            render_form_field(create_contact.last) do |t|
              t.text_input value: create_contact.last.original_value || ""
            end
          end
          div class: "w-full max-w-xs" do
            render_form_field(create_contact.email) do |t|
              t.email_input(
                placeholder: "you@example.com",
                value: create_contact.email.original_value || "",
                attrs: [:required]
              )
            end
          end
          div class: "w-full max-w-xs" do
            render_form_field(create_contact.phone) do |t|
              t.text_input value: create_contact.phone.original_value || ""
            end
          end
        end
        div class: "flex flex-col items-center mt-6" do
          mount UI::PrimaryButton do |t|
            t.submit "Create"
          end
        end
      end
    end
  end

  private def render_form_field(attr, text : String? = nil, &)
    label = text || Wordsmith::Inflector.humanize(attr.name.to_s)
    label_for(attr, label, class: "block text-sm font-medium leading-6 text-gray-900")
    div class: "relative mt-1 rounded-md shadow-sm" do
      tag_defaults field: attr, class: "block w-full rounded-md border-0 py-1.5 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-300 focus:ring-2 focus:ring-inset focus:ring-gray-500 sm:text-sm sm:leading-6 invalid:text-red-600 focus:invalid:ring-red-600" do |tag_builder|
        yield tag_builder
      end
    end
    unless attr.valid?
      div class: "mt-2 text-sm text-red-600" do
        text "#{label} #{attr.errors.first}"
      end
    end
  end
end
