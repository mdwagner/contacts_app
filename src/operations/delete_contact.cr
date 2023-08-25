class DeleteContact < Avram::Operation
  needs contact_id : String

  def run
    delete_statement
  rescue e : AppDatabase::SQLite3Exception
    add_error(:flash_errors, "Failed to delete Contact")
    nil
  end

  private def delete_statement
    AppDatabase.open do |db|
      return db.transaction do |tx|
        c = tx.connection
        c.exec(<<-SQL, args: [contact_id])
        DELETE FROM contacts
        WHERE id = ?
        SQL
      end
    end
  end
end
