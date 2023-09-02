class Contacts::IndexScreen < MainScreen
  getter(contacts) { Contact.all }

  def render
    doc do
      screen do
        styles do
          style id: "body", flex: "1", flexDirection: "row", justifyContent: "center", padding: "14"
          style id: "button-text", fontSize: "24"
        end
        body style: "body" do
          view trigger: "press", action: "reload" do
            text "RELOAD", style: "button-text"
          end
        end
      end
    end
  end
end
