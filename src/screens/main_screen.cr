abstract class MainScreen < Lucky::HXMLScreen
  abstract def render_header
  abstract def render_content

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
            backgroundColor: "white"
          )
          style(
            id: "header-title",
            color: "black",
            fontSize: "24",
            fontWeight: "600"
          )
          style id: "header-add", padding: "8", fontSize: "16"
          style(
            id: "search-field",
            height: "48",
            paddingLeft: "24",
            paddingRight: "24",
            backgroundColor: "#EEEEEE",
            borderTopWidth: "1",
            borderTopColor: "#D6D6D6",
            borderBottomWidth: "1",
            borderBottomColor: "#D6D6D6"
          ) do
            modifier focused: "true" do
              style borderBottomColor: "#777777"
            end
          end
          style(
            id: "contact-item",
            flex: "1",
            flexDirection: "row",
            height: "48",
            paddingLeft: "24",
            paddingRight: "24",
            alignItems: "center",
            backgroundColor: "#FFFFFF",
            borderBottomWidth: "1",
            borderBottomColor: "#EEE"
          )
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

  private def lr_ns_attr : Nil
    attribute "xmlns:lr", "http://dev.localhost/livereload"
  end
end
