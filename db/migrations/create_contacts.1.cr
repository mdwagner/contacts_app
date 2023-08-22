class CreateContacts < MG::Base
  def up : String
    <<-SQL
    CREATE TABLE contacts (
      id integer PRIMARY KEY AUTOINCREMENT,
      email text NOT NULL,
      first text,
      last text,
      phone text,
      created_at text NOT NULL,
      updated_at text NOT NULL
    );
    CREATE UNIQUE INDEX contacts_email_idx ON contacts (email);
    SQL
  end

  def down : String
    ""
  end
end
