class CreateContact < Avram::Operation
  attribute email : String
  attribute first : String
  attribute last : String
  attribute phone : String

  before_run do
    validate_required email
    validate_format_of email, with: /[^@]+@[^.]+..+/
  end

  def run
    insert_statement
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
