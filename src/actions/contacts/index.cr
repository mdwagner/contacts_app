class Contacts::Index < BrowserAction
  param q : String?
  param page : Int32? = 1
  param rows_only : Bool? = false

  get "/contacts" do
    html Contacts::IndexPage, query: q, page: page
  end
end
