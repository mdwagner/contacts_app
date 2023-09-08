abstract class MainScreen < Lucky::HXMLScreen
  # Override to add custom styles to default styles
  abstract def append_styles

  # Override to replace with custom styles
  abstract def render_styles

  # Override to replace with custom header
  abstract def render_header

  abstract def render_content

  def append_styles
  end

  def render_styles
    style(
      id: "body",
      flex: "1",
      backgroundColor: "white"
    )
    style(
      id: "header",
      alignItems: "center",
      flexDirection: "row",
      justifyContent: "space-between",
      paddingLeft: Theme.spacing(6),
      paddingRight: Theme.spacing(6),
      paddingTop: Theme.spacing(3),
      paddingBottom: Theme.spacing(3),
      backgroundColor: "white",
      borderBottomWidth: "1",
      borderBottomColor: Theme.colors("gray", 300),
    )
    style(
      id: "header-title",
      color: "black",
      fontSize: Theme.font_size("2xl"),
      fontWeight: Theme.font_weight("semibold")
    )
    style(
      id: "header-add",
      padding: Theme.spacing(2),
      fontSize: Theme.font_size("base")
    )
    style(
      id: "main",
      flex: "1"
    )
    append_styles
  end

  def render_header
    text "Contacts",
      style: "header-title",
      trigger: "longPress",
      action: "reload"
    text "Add",
      style: "header-add",
      "xmlns:alert": "https://hyperview.org/hyperview-alert",
      trigger: "press",
      action: "alert",
      "alert:title": "Create a new Contact",
      "alert:message": "Coming Soon!"
  end

  def render
    doc do
      attribute "xmlns:live-reload", "http://dev.localhost/live-reload"
      screen do
        styles do
          render_styles
        end
        body style: "body", "safe-area": "true", trigger: "load", action: "live-reload" do
          header style: "header" do
            render_header
          end
          view style: "main" do
            render_content
          end
        end
      end
    end
  end
end
