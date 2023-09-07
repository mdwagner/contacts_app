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
      paddingLeft: "24",
      paddingRight: "24",
      paddingTop: "12",
      paddingBottom: "12",
      backgroundColor: "white",
      borderBottomWidth: "1",
      borderBottomColor: "#D6D6D6",
    )
    style(
      id: "header-title",
      color: "black",
      fontSize: "24",
      fontWeight: "600"
    )
    style(
      id: "header-add",
      padding: "8",
      fontSize: "16"
    )
    style(
      id: "main",
      flex: "1"
    )
    style(
      id: "footer",
      paddingBottom: "28"
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
      lr_ns_attr
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
          view style: "footer" { }
        end
      end
    end
  end

  private def lr_ns_attr : Nil
    attribute "xmlns:lr", "http://dev.localhost/livereload"
  end
end
