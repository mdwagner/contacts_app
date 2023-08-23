abstract class MainLayout
  include Lucky::HTMLPage

  abstract def content
  abstract def page_title

  def page_title
    "Contacts App"
  end

  def render
    html_doctype

    html lang: "en" do
      mount Shared::LayoutHead, page_title: page_title

      body class: "x-cloak bg-slate-200 w-auto flex flex-col justify-center space-y-4" do
        header class: "mx-auto" do
          link page_title, class: "h-full flex p-4 text-gray-500 text-2xl font-sans font-medium leading-normal", to: Home::Index
        end
        div class: "mx-auto" do
          mount Shared::FlashMessages, context.flash
          content
        end
      end
    end
  end

  def error_for(field)
    mount Shared::FieldErrors, field
  end
end
