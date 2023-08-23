class UpdateContact < Avram::Operation
  needs contact_id : String

  attribute email : String
  attribute first : String
  attribute last : String
  attribute phone : String

  before_run do
    validate_required email
    validate_format_of email, with: /[^@]+@[^.]+..+/
  end

  def run
    update_statement
  rescue e : SQLite3::Exception
    if e.code == 19
      email.add_error "already exists"
      return nil
    end
    raise e
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
          phone = ?
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
      contact_id,
    ]
  end
end
