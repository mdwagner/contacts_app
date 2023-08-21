class Contacts::Index < BrowserAction
  get "/contacts" do
    html Contacts::IndexPage
  end
end
