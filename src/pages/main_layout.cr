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

      body class: "x-cloak bg-slate-200 w-auto flex flex-col justify-center space-y-4, mb-8", hx_headers: hx_headers do
        header class: "mx-auto" do
          link page_title, class: "h-full flex p-4 text-gray-500 text-2xl font-sans font-medium leading-normal", to: Home::Index, hx_boost: "true"
        end
        div class: "mx-auto" do
          mount Shared::FlashMessages, context.flash
          content
        end
      end
    end
  end

  private def hx_headers
    {
      Lucky::ProtectFromForgery::SESSION_KEY => Lucky::ProtectFromForgery.get_token(context)
    }.to_json
  end
end
