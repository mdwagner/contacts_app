class Shared::LayoutHead < BaseComponent
  needs page_title : String

  def render
    head do
      utf8_charset
      title @page_title

      tailwind_css
      alpine_js
      htmx_js

      app_css
      app_js

      csrf_meta_tags
      responsive_meta_tag

      live_reload_connect_tag
    end
  end

  # TODO: run tailwindcss cli to generate compile-time classes for production
  private def tailwind_css
    tag "script",
      src: "https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"
  end

  # TODO: vendor for production
  private def alpine_js
    tag "script",
      src: "https://unpkg.com/alpinejs@3.11.1/dist/cdn.min.js",
      defer: "true"
  end

  # TODO: vendor for production
  private def htmx_js
    tag "script",
      src: "https://unpkg.com/htmx.org@1.8.5",
      integrity: "sha384-7aHh9lqPYGYZ7sTHvzP1t3BAfLhYSTy9ArHdP3Xsr9/3TlGurYgcPBoFmXX2TX/w",
      crossorigin: "anonymous"
  end

  # TODO: use readfile macro (src/css/app.css) for production
  private def app_css
    tag "style", media: "screen" do
      raw <<-CSS
      [x-cloak] {
        display: none !important;
      }
      CSS
    end
  end

  # TODO: use readfile macro (src/js/app.js) for production
  private def app_js
    tag "script", defer: "true"
  end
end
