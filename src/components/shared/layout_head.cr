class Shared::LayoutHead < BaseComponent
  needs page_title : String

  def render
    head do
      utf8_charset
      title page_title

      app_css
      tailwind_css
      htmx_js
      font_awesome
      alpine_js

      csrf_meta_tags
      responsive_meta_tag

      _live_reload_connect_tag
    end
  end

  private def tailwind_css
    tag "script",
      src: "https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio"
  end

  private def alpine_js
    tag "script",
      src: "https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js",
      defer: "true"
  end

  private def htmx_js
    tag "script",
      src: "https://unpkg.com/htmx.org@1.9.4",
      integrity: "sha384-zUfuhFKKZCbHTY6aRR46gxiqszMk5tcHjsVFxnUo8VMus4kHGVdIYVbOYYNlKmHV",
      crossorigin: "anonymous"
  end

  private def font_awesome
    tag "script",
      src: "https://kit.fontawesome.com/717a8b0c15.js",
      crossorigin: "anonymous"
  end

  private def app_css
    tag "style", media: "screen" do
      raw <<-CSS
      [x-cloak] {
        display: none !important;
      }
      CSS
    end
  end

  # TODO: add back live_reload_connect_tag after merged into Lucky core
  private def _live_reload_connect_tag
    tag "script" do
      raw <<-JS
      (function() {
        var ws = new WebSocket("ws://#{Lucky::ServerSettings.host}:#{Lucky::ServerSettings.reload_port}");
        ws.onmessage = function() {
          setTimeout(function() {
            location.reload();
          }, 1000);
        };
      })();
      JS
    end
  end
end
