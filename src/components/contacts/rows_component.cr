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
      hyperview_namespace

      contacts.each do |contact|
        item key: contact.id, style: "contact-item" do
          behavior(
            trigger: "press",
            action: "push",
            href: Contacts::Show.with(contact_id: contact.id).path
          )
          text contact_text(contact), style: "contact-item-label"
        end
      end

      if contacts.size == 10
        item key: "load-more", id: "load-more", style: "load-more-item" do
          behavior(
            trigger: "visible",
            action: "replace",
            target: "load-more",
            verb: "get",
            href: Contacts::Index.with(page: page + 1, rows_only: true).path
          )
          spinner
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
