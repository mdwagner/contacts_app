class FormField(T) < BaseComponent
  include Lucky::CatchUnpermittedAttribute

  needs attribute : Avram::PermittedAttribute(T)
  needs label_text : String?

  def render(&)
    label_for(attribute, render_label, class: "block text-sm font-medium leading-6 text-gray-900")
    div class: "relative mt-1 rounded-md shadow-sm" do
      tag_defaults field: attribute, class: "block w-full rounded-md border-0 py-1.5 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-300 focus:ring-2 focus:ring-inset focus:ring-gray-500 sm:text-sm sm:leading-6 invalid:border-red-500 invalid:text-red-600 focus:invalid:border-red-500 focus:invalid:ring-red-600 required:invalid:ring-red-500" do |tag_builder|
        yield tag_builder
      end
    end
    unless attribute.valid?
      div class: "mt-2 text-sm text-red-600" do
        text "#{render_label} #{attribute.errors.first}"
      end
    end
  end

  private def render_label : String
    label_text || Wordsmith::Inflector.humanize(attribute.name.to_s)
  end
end
