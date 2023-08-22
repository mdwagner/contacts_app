class Contacts::IndexPage < MainLayout
  needs query : String?

  def content
    div class: "max-w-4xl shadow-xl rounded-lg px-6 py-4 bg-white" do
      form_for(Index, class: "flex justify-center items-center space-x-4 align-middle") do
        label "Search Term", class: "text-sm font-medium leading-6 text-gray-900", for: "search"
        input class: "rounded-md border-0 py-1.5 pr-14 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-slate-600 sm:text-sm sm:leading-6", id: "search", name: "q", type: "text"
        button "Search", class: "rounded-md bg-slate-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-slate-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-slate-600", type: "submit"
      end
      div class: "mt-4 flow-root" do
        div class: "-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8" do
          div class: "inline-block py-2 align-middle sm:px-6 lg:px-8" do
            table class: "divide-y divide-gray-300" do
              thead do
                tr do
                  th "First Name", class: "py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-0", scope: "col"
                  th "Last Name", class: "px-3 py-3.5 text-left text-sm font-semibold text-gray-900", scope: "col"
                  th "Email", class: "px-3 py-3.5 text-left text-sm font-semibold text-gray-900", scope: "col"
                  th "Phone", class: "px-3 py-3.5 text-left text-sm font-semibold text-gray-900", scope: "col"
                  th class: "relative py-3.5 pl-3 pr-4 sm:pr-0", scope: "col" do
                    span "Edit", class: "sr-only"
                  end
                end
              end
              tbody class: "divide-y divide-gray-200" do
                contacts_query.each do |contact|
                  tr do
                    td contact.first || "NULL", class: "whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-0"
                    td contact.last || "NULL", class: "whitespace-nowrap px-3 py-4 text-sm text-gray-500"
                    td contact.email, class: "whitespace-nowrap px-3 py-4 text-sm text-gray-500"
                    td contact.phone || "NULL", class: "whitespace-nowrap px-3 py-4 text-sm text-gray-500"
                    td class: "relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-0" do
                      a "Edit", class: "text-slate-600 hover:text-slate-900", href: "#"
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  private def contacts_query
    AppDatabase.open do |db|
      if q = query
        q = "%#{q}%"
        return Contact.from_rs(db.query(<<-SQL, args: [q, q, q, q]))
        SELECT
          *
        FROM
          contacts
        WHERE
          first LIKE ? OR
          last LIKE ? OR
          phone LIKE ? OR
          email LIKE ?
        LIMIT 10
        SQL
      else
        return Contact.from_rs(db.query(<<-SQL))
        SELECT
          *
        FROM
          contacts
        SQL
      end
    end
  end
end
