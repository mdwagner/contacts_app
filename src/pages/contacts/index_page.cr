class Contacts::IndexPage < MainLayout
  def content
    div class: "flex flex-col p-4 mx-auto" do
      h1 "Hello World!", class: "text-2xl"
      br
      h2 "Contacts count", class: "text-xl"
      pre contacts_count
      br
      h2 "Table names", class: "text-xl"
      ul do
        table_names.each do |name|
          li name
        end
      end
    end
  end

  private def contacts_count : Int32
    DB.open ENV["DATABASE_URL"] do |db|
      return db.query_one <<-SQL, as: Int32
      SELECT
        COUNT(id)
      FROM
        contacts
      SQL
    end
  end

  private def table_names
    DB.open ENV["DATABASE_URL"] do |db|
      return db.query_all <<-SQL, as: String
      SELECT
        name
      FROM
        sqlite_master
      WHERE
        type = "table"
      SQL
    end
  end
end
