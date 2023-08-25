class Contacts::IndexPage < MainLayout
  needs query : String?

  @contacts : Array(Contact)?

  def content
    div class: "max-w-4xl shadow-xl rounded-lg px-6 py-4 bg-white w-[768px]" do
      div class: "flex justify-between" do
        form_for(Contacts::Index) do
          div class: "flex items-center space-x-4" do
            label "Search Term", for: "search", class: "text-sm font-medium leading-6 text-gray-900"
            input id: "search", name: "q", type: "search", value: query || "", class: "rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-slate-600 sm:text-sm sm:leading-6 min-w-[14rem]"
            input value: "Search", type: "submit", class: "rounded-md bg-slate-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-slate-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-slate-600 hover:cursor-pointer"
          end
        end
        link "Add Contact", to: Contacts::New, class: "bg-slate-600 rounded-md px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-slate-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-slate-600"
      end
      div class: "mt-4 flow-root" do
        if contacts_query.size > 0
          render_table
        else
          div class: "flex justify-center text-gray-600 text-3xl my-12" do
            text "No results found"
          end
        end
      end
    end
  end

  private def render_table
    table class: "w-full divide-y divide-gray-300" do
      thead do
        tr do
          th "First Name", class: "whitespace-nowrap py-3.5 text-left text-sm font-semibold text-gray-900 w-[15%]", scope: "col"
          th "Last Name", class: "whitespace-nowrap px-3 py-3.5 text-left text-sm font-semibold text-gray-900 w-[15%]", scope: "col"
          th "Email", class: "whitespace-nowrap px-3 py-3.5 text-left text-sm font-semibold text-gray-900 w-[40%]", scope: "col"
          th "Phone", class: "whitespace-nowrap px-3 py-3.5 text-left text-sm font-semibold text-gray-900 w-[20%]", scope: "col"
          th class: "whitespace-nowrap relative py-3.5 pl-3 pr-4 sm:pr-0 w-[10%]", scope: "col" do
            span "Edit", class: "sr-only"
          end
        end
      end
      tbody class: "divide-y divide-gray-200" do
        contacts_query.each do |contact|
          tr do
            td contact.first || "", class: "whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-500 sm:pl-0"
            td contact.last || "", class: "whitespace-nowrap px-3 py-4 text-sm text-gray-500"
            td contact.email, class: "whitespace-nowrap px-3 py-4 text-sm text-gray-500"
            td contact.phone || "", class: "whitespace-nowrap px-3 py-4 text-sm text-gray-500"
            td class: "relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-0 space-x-2" do
              link "Edit", to: Contacts::Edit.with(contact_id: contact.id), class: "text-slate-500 hover:text-slate-900"
            end
          end
        end
      end
    end
  end

  private def contacts_query
    @contacts ||= (
      if q = query
        Contact.search(q)
      else
        Contact.all
      end
    )
  end
end
