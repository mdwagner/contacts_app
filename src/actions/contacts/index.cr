class Contacts::Index < BrowserAction
  param q : String?
  param page : Int32? = 1
  param rows_only : Bool? = false

  get "/contacts" do
    if xml?
      if rows_only
        hxml_component Contacts::RowsComponent, query: q, page: page
      else
        hxml Contacts::IndexScreen, query: q, page: page
      end
    else
      html Contacts::IndexPage, query: q, page: page
    end
  end
end
