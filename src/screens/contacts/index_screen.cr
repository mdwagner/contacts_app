class Contacts::IndexScreen < MainScreen
  @contacts : Array(Contact)?

  def render(xml)
    xml.element "doc" do
      xml.attribute "xmlns", "https://hyperview.org/hyperview"

      xml.element "screen" do
        render_styles(xml)
        xml.element "body", style: "Main" do
          render_body(xml)
        end
      end
    end
  end

  def render_styles(xml)
    xml.element "styles" do
      xml.element "style",
        id: "Main",
        flex: "1",
        paddingTop: "48",
        paddingLeft: "24",
        paddingRight: "24",
        backgroundColor: "white"

      xml.element "style",
        id: "Item",
        flex: "1",
        justifyContent: "center",
        height: "48",
        borderBottomWidth: "1",
        borderBottomColor: "#eee"
    end
  end

  def render_body(xml)
    xml.element "list" do
      if contacts_query.size > 0
        contacts_query.each do |contact|
          xml.element "item", key: contact.id, style: "Item" do
            xml.element "text" do
              xml.text contact.email
            end
          end
        end
      else
        xml.element "view" do
          xml.element "text" do
            xml.text "No Results"
          end
        end
      end
    end
    xml.element "view", trigger: "press", action: "reload" do
      xml.element "text" do
        xml.text "RELOAD"
      end
    end
  end

  private def contacts_query
    @contacts ||= Contact.all
  end
end
