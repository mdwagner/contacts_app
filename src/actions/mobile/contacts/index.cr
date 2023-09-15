class Mobile::Contacts::Index < MobileAction
  param q : String?
  param page : Int32? = 1
  param rows_only : Bool? = false

  get "/mobile/contacts" do
    if rows_only
      hxml_component RowsComponent, query: q, page: page
    else
      hxml Contacts::IndexScreen, query: q, page: page
    end
  end
end
