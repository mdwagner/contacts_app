class Contacts::Index < BrowserAction
  param q : String?
  param page : Int32? = 1
  param rows_only : Bool? = false

  get "/contacts" do
    if xml?
      hxml Contacts::IndexScreen, query: q, page: page, rows_only: rows_only
    else
      html Contacts::IndexPage, query: q, page: page
    end
  end
end
