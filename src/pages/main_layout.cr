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

      body class: "x-cloak bg-slate-200 w-auto flex flex-col justify-center space-y-4, mb-8" do
        header class: "mx-auto" do
          link page_title, class: "h-full flex p-4 text-gray-500 text-2xl font-sans font-medium leading-normal", to: Home::Index, hx_boost: "true"
        end
        div class: "mx-auto" do
          mount Shared::FlashMessages, context.flash
          content
        end
        configure_htmx_request_script
      end
    end
  end

  private def configure_htmx_request_script
    tag "script", type: "text/javascript" do
      raw <<-JS
      document.body.addEventListener('htmx:configRequest', function(evt) {
        var csrf_token = document.querySelector("meta[name='csrf-token']").getAttribute("content");
        function csrfSafeMethod(method) {
          // these HTTP methods do not require CSRF protection
          return (/^(GET|HEAD|OPTIONS)$/i.test(method));
        }
        if (!csrfSafeMethod(evt.detail.verb)) {
          evt.detail.headers["X-CSRF-TOKEN"] = csrf_token;
        }
      });
      JS
    end
  end
end
