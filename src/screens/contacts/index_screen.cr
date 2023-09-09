class Contacts::IndexScreen < MainScreen
  needs query : String?
  needs page : Int32

  getter(contacts) do
    if q = query
      Contact.search(q, offset: (page - 1) * 10, limit: 10)
    else
      Contact.all(offset: (page - 1) * 10, limit: 10)
    end
  end

  def append_styles
    style(
      id: "header-button",
      color: Theme.colors("blue", 600),
      fontSize: Theme.font_size("lg"),
      fontWeight: Theme.font_weight("medium")
    )
    style(
      id: "search-field",
      height: Theme.spacing(12),
      paddingLeft: Theme.spacing(6),
      paddingRight: Theme.spacing(6),
      backgroundColor: Theme.colors("gray", 100),
      borderBottomWidth: "1",
      borderBottomColor: Theme.colors("gray", 300)
    ) do
      modifier focused: "true" do
        style borderBottomColor: "#777777"
      end
    end
    style(
      id: "contact-item",
      flex: "1",
      flexDirection: "row",
      height: Theme.spacing(12),
      paddingLeft: Theme.spacing(6),
      paddingRight: Theme.spacing(6),
      alignItems: "center",
      backgroundColor: "white",
      borderBottomWidth: "1",
      borderBottomColor: Theme.colors("gray", 100)
    )
  end

  def render_header
    text "Contacts",
      style: "header-title",
      trigger: "longPress",
      action: "reload"

    text "Add", style: "header-button" do
      behavior trigger: "press", action: "new", href: Contacts::New.path
    end
  end

  def render_content
    form style: "flex-1" do
      behavior(
        trigger: "on-event",
        "event-name": "contact-updated",
        action: "replace-inner",
        target: "contacts-list",
        verb: "get",
        href: Contacts::Index.with(rows_only: true).path
      )

      text_field(
        name: "q",
        value: query || "",
        placeholder: "Search...",
        style: "search-field"
      ) do
        behavior(
          trigger: "change",
          action: "replace-inner",
          target: "contacts-list",
          verb: "get",
          href: Contacts::Index.with(rows_only: true).path,
          delay: "700"
        )
      end

      list(
        id: "contacts-list",
        trigger: "refresh",
        action: "replace-inner",
        target: "contacts-list",
        verb: "get",
        href: Contacts::Index.with(rows_only: true).path
      ) do
        mount Contacts::RowsComponent, query: query, page: page
      end
    end
  end
end
