class Contacts::IndexScreen < MainScreen
  needs query : String?
  needs page : Int32
  needs rows_only : Bool

  getter(contacts) do
    if q = query
      Contact.search(q, offset: (page - 1) * 10, limit: 10)
    else
      Contact.all(offset: (page - 1) * 10, limit: 10)
    end
  end

  def render
    if rows_only?
      render_rows
    else
      render_screen
    end
  end

  def render_rows
    items do
      hv_ns_attr
      contacts.each do |contact|
        item key: contact.id, style: "contact-item" do
          text contact_text(contact), style: "contact-item-label"
        end
      end
    end
  end

  def render_screen
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
              text_field name: "q", value: query || "", placeholder: "Search...", style: "search-field" do
                behavior(
                  trigger: "change",
                  action: "replace-inner",
                  target: "contacts-list",
                  verb: "get",
                  href: Contacts::Index.with(q: query, page: page, rows_only: true).path,
                  delay: "700"
                )
              end
              list id: "contacts-list" do
                render_rows
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
