class Errors::ShowPage
  include Lucky::HTMLPage

  needs message : String
  needs status_code : Int32

  def render
    html_doctype

    html lang: "en" do
      mount Shared::LayoutHead, page_title: message

      body class: "x-cloak bg-slate-200" do
        main class: "grid min-h-full place-items-center px-6 py-24 sm:py-32 lg:px-8" do
          div class: "text-center" do
            para status_code, class: "text-base font-semibold text-gray-600"
            h1 message, class: "mt-4 text-3xl font-bold tracking-tight text-gray-900 sm:text-5xl"
            para "Have you tried turning it off and on again?", class: "mt-6 text-base leading-7 text-gray-600"
            div class: "mt-10 flex items-center justify-center" do
              a "Go back home", href: "/", class: "rounded-md bg-gray-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-gray-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-600"
            end
          end
        end
      end
    end
  end
end
