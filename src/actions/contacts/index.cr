class Contacts::Index < BrowserAction
  param q : String?

  get "/contacts" do
    html Contacts::IndexPage, query: q
  end
end
