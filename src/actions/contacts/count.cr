class Contacts::Count < BrowserAction
  get "/contacts/count" do
    sleep 3 # NOTE: really complicated logic...lol
    plain_text "(#{Contact.count} total Contacts)"
  end
end
