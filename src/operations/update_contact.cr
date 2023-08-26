class UpdateContact < Avram::Operation
  needs contact_id : String

  attribute email : String
  attribute first : String
  attribute last : String
  attribute phone : String

  before_run do
    validate_required email
    validate_format_of email, with: /[^@]+@[^.]+..+/
    downcase_email
    validate_email_unique
  end

  def run
    update_statement
  rescue e : AppDatabase::SQLite3Exception
    add_error(:flash_errors, "Failed to update Contact")
    nil
  end

  private def downcase_email
    email.value.try do |value|
      email.value = value.downcase
    end
  end

  private def validate_email_unique
    email.value.try do |value|
      if contact = Contact.find_by_email?(value)
        unless contact_id == contact.id.to_s
          email.add_error "already exists"
        end
      end
    end
  end

  private def update_statement
    AppDatabase.open do |db|
      return db.transaction do |tx|
        c = tx.connection
        c.exec(<<-SQL, args: args)
        UPDATE
          contacts
        SET
          email = ?,
          first = ?,
          last = ?,
          phone = ?,
          updated_at = ?
        WHERE id = ?
        SQL
      end
    end
  end

  private def args
    [
      email.value,
      first.value,
      last.value,
      phone.value,
      datetime_now,
      contact_id,
    ]
  end

  private def datetime_now
    Time::Format::ISO_8601_DATE_TIME.format(Time.utc)
  end
end
