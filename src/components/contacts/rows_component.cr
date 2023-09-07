class Contacts::RowsComponent < BaseHXMLComponent
  needs query : String?
  needs page : Int32

  getter(contacts) do
    if q = query
      Contact.search(q, offset: (page - 1) * 10, limit: 10)
    else
      Contact.all(offset: (page - 1) * 10, limit: 10)
    end
  end

  def render
    items do
      hv_ns_attr
      contacts.each do |contact|
        item key: contact.id, style: "contact-item" do
          text contact_text(contact), style: "contact-item-label"
        end
      end
    end
  end

  private def contact_text(contact) : String
    if first = contact.first
      "#{first} #{contact.last}"
    elsif phone = contact.phone
      phone
    else
      contact.email
    end
  end
end
