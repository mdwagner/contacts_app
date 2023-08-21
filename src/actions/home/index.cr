class Home::Index < BrowserAction
  get "/" do
    redirect Contacts::Index
  end
end
