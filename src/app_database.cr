class AppDatabase
  alias SQLite3Exception = SQLite3::Exception
  alias SQLite3Code = LibSQLite3::Code

  DATABASE_URL = ENV["DATABASE_URL"]? || "sqlite3://db/contacts.db"

  def self.open(&)
    DB.open(DATABASE_URL) do |db|
      yield db
    end
  end

  def self.connect(&)
    DB.connect(DATABASE_URL) do |conn|
      yield conn
    end
  end
end
