class UnusedDatabase < Avram::Database
end

UnusedDatabase.configure do |settings|
  settings.credentials = Avram::Credentials.void
end

Avram.configure do |settings|
  settings.database_to_migrate = UnusedDatabase
end
