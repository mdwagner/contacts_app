class Contacts::IndexScreen < MainScreen
  getter(contacts) { Contact.all }

  def render
    doc do
      screen do
        styles do
          style id: "body", flex: "1", flexDirection: "row", justifyContent: "center", padding: "14"
          style id: "button-text", fontSize: "26"
        end
        body style: "body", "xmlns:lr": "http://dev.localhost/dev-livereload" do
          behavior trigger: "load", action: "live-reload", "lr:uri": "ws://192.168.50.74:3001"

          view trigger: "press", action: "reload" do
            text "RELOAD", style: "button-text"
          end
        end
      end
    end
  end
end
