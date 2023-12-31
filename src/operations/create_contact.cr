class CreateContact < Avram::Operation
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
    insert_statement
  rescue e : AppDatabase::SQLite3Exception
    add_error(:flash_errors, "Failed to create Contact")
    nil
  end

  private def downcase_email
    email.value.try do |value|
      email.value = value.downcase
    end
  end

  private def validate_email_unique
    email.value.try do |value|
      if Contact.find_by_email?(value)
        email.add_error "already exists"
      end
    end
  end

  private def insert_statement
    AppDatabase.open do |db|
      return db.transaction do |tx|
        c = tx.connection
        c.exec(<<-SQL, args: args)
        INSERT INTO contacts
        (email, first, last, phone, created_at, updated_at)
        VALUES
        (?, ?, ?, ?, ?, ?)
        SQL
      end
    end
  end

  private def args
    time = datetime_now
    [
      email.value,
      first.value,
      last.value,
      phone.value,
      time,
      time,
    ]
  end

  private def datetime_now
    Time::Format::ISO_8601_DATE_TIME.format(Time.utc)
  end
end
