class NullDatabase < Avram::Database
end

NullDatabase.configure do |settings|
  settings.credentials = Avram::Credentials.void
end

Avram.configure do |settings|
  settings.database_to_migrate = NullDatabase
end
