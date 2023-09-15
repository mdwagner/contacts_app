class Home::Index < BrowserAction
  get "/" do
    if xml?
      redirect Mobile::Contacts::Index
    else
      redirect Contacts::Index
    end
  end
end
