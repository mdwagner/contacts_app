class Contacts::IndexPage < MainLayout
  needs query : String?
  needs page : Int32

  @contacts : Array(Contact)?

  def content
    mount RoundedContainer do
      div class: "flex justify-between" do
        form method: form_method(Contacts::Index.route), action: Contacts::Index.path, hx_boost: "true", hx_trigger: "keyup changed delay:700ms from:#search, input delay:500ms from:#search", hx_indicator: "#indicator" do
          div class: "flex items-center space-x-4" do
            label "Search Term", for: "search", class: "text-sm font-medium leading-6 text-gray-900"
            input id: "search", name: "q", type: "search", value: query || "", class: "rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-slate-600 sm:text-sm sm:leading-6 min-w-[14rem]"
            spinner
          end
        end
        link "Add Contact", to: Contacts::New, hx_boost: "true", class: "bg-slate-600 rounded-md px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-slate-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-slate-600"
      end
      div class: "flex justify-end" do
        span hx_get: Contacts::Count.path, hx_trigger: "revealed", class: "mt-4" do
          spinner("count-indiciator")
        end
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
          th class: "w-[10%]", scope: "col" do
            span "Edit", class: "sr-only", aria_hidden: "true"
            span "Delete", class: "sr-only", aria_hidden: "true"
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
            td class: "whitespace-nowrap py-4 flex justify-end space-x-3 text-gray-900" do
              button type: "button", aria_label: "Edit", hx_get: Contacts::Edit.with(contact_id: contact.id).path, hx_target: "body", hx_push_url: "true" do
                i class: "fa-regular fa-pen-to-square"
              end
              button type: "button", aria_label: "Delete", hx_delete: Contacts::Delete.with(contact_id: contact.id).path,
                hx_target: "closest tr", hx_swap: "delete", hx_confirm: "Are you sure?" do
                i class: "fa-solid fa-xmark"
              end
            end
          end
        end

        if contacts_query.size == 10
          tr do
            td colspan: "5", class: "text-center pt-4" do
              span "Loading More...",
                hx_target: "closest tr", hx_swap: "outerHTML", hx_select: "tbody > tr",
                hx_get: Contacts::Index.with(page: page + 1, q: query).path, hx_trigger: "revealed"
            end
          end
        end
      end
    end
  end

  private def contacts_query
    @contacts ||= (
      if q = query
        Contact.search(q, offset: (page - 1) * 10, limit: 10)
      else
        Contact.all(offset: (page - 1) * 10, limit: 10)
      end
    )
  end

  private def spinner(id = "indicator")
    div role: "status" do
      tag "svg", aria_hidden: "true", id: id, class: "htmx-indicator w-6 h-6 mr-2 text-gray-200 animate-spin fill-gray-600", fill: "none", viewbox: "0 0 100 101", xmlns: "http://www.w3.org/2000/svg" do
        tag "path", d: "M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z", fill: "currentColor"
        tag "path", d: "M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z", fill: "currentFill"
      end
      span "Loading...", class: "sr-only"
    end
  end
end
