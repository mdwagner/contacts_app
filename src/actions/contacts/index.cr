class Contacts::Index < BrowserAction
  param q : String?
  param page : Int32? = 1

  get "/contacts" do
    if xml?
      xml Contacts::IndexScreen.new.to_s
    else
      html Contacts::IndexPage, query: q, page: page
    end
  end
end
