class Contacts::IndexScreen < MainScreen
  property query : String?
  property rows_only : Bool

  getter(contacts) do
    if (q = query) && !q.empty?
      Contact.search(q)
    else
      Contact.all
    end
  end

  def initialize(@rows_only, @query = nil)
  end

  def render
    if rows_only
      items "xmlns": "https://hyperview.org/hyperview" do
        contacts.each do |contact|
          item key: contact.id, style: "contact-item" do
            text contact_text(contact), style: "contact-item-label"
          end
        end
      end
    else
      render_screen
    end
  end

  def render_screen
    doc "xmlns:lr": "http://dev.localhost/livereload" do
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
            text "Contacts", style: "header-title", trigger: "longPress", action: "reload"
            text "Add",
              style: "header-add",
              "xmlns:alert": "https://hyperview.org/hyperview-alert",
              trigger: "press",
              action: "alert",
              "alert:title": "Create a new Contact",
              "alert:message": "Coming Soon!"
          end
          view style: "main" do
            form do
              text_field name: "q", value: "", placeholder: "Search...", style: "search-field" do
                behavior trigger: "change", action: "replace-inner", target: "contacts-list", href: Contacts::Index.with(rows_only: true).path, verb: "get", delay: "700"
              end
              list id: "contacts-list" do
                items do
                  contacts.each do |contact|
                    item key: contact.id, style: "contact-item" do
                      text contact_text(contact), style: "contact-item-label"
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  private def contact_text(contact) : String
    if first = contact.first
      "#{first} #{contact.last}"
    elsif phone = contact.phone
      phone
    else
      contact.email
    end
  end
end
