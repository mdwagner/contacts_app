class Contact
  DB.mapping({
    id: Int64,
    email: String,
    first: String?,
    last: String?,
    phone: String?,
    created_at: {
      type: Time,
      nilable: false,
      converter: TimeUtcConverter
    },
    updated_at: {
      type: Time,
      nilable: false,
      converter: TimeUtcConverter
    }
  })

  # Returns Top 10 Contacts based on search _term_
  def self.search(term : String) : Array(Contact)
    q = "%#{term}%"
    AppDatabase.open do |db|
      return Contact.from_rs(db.query(<<-SQL, args: [q, q, q, q]))
      SELECT * FROM contacts
      WHERE
        first LIKE ?
        OR
        last LIKE ?
        OR
        phone LIKE ?
        OR
        email LIKE ?
      LIMIT 10
      SQL
    end
  end

  # Returns all Contacts
  def self.all : Array(Contact)
    AppDatabase.open do |db|
      return Contact.from_rs(db.query(<<-SQL))
      SELECT * FROM contacts
      SQL
    end
  end
end
