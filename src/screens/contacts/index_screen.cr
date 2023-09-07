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

  def render_content
    form do
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
