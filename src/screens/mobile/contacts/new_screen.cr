class Mobile::Contacts::NewScreen < MainScreen
  needs create_contact : CreateContact

  def append_styles
    style(
      id: "header-button",
      color: Theme.colors("blue", 600),
      fontSize: Theme.font_size("lg"),
      fontWeight: Theme.font_weight("medium"),
      padding: Theme.spacing(2)
    )
    style(
      id: "form-container",
      flex: "1",
      flexDirection: "column",
      justifyContent: "space-between"
    )
    style(
      id: "action-group",
      borderTopWidth: "1",
      borderTopColor: Theme.colors("gray", 300)
    )
    style(
      id: "button",
      width: "100%",
      height: Theme.spacing(14),
      flexDirection: "row",
      alignItems: "center",
      backgroundColor: "white",
      borderBottomWidth: "1",
      borderBottomColor: Theme.colors("gray", 300),
      paddingHorizontal: Theme.spacing(6)
    )
    style(
      id: "button-label",
      color: Theme.colors("blue", 600),
      fontSize: Theme.font_size("base"),
      fontWeight: Theme.font_weight("medium")
    )
    style(
      id: "new-field-container",
      width: "100%",
      height: Theme.spacing(14),
      flexDirection: "column",
      justifyContent: "center",
      alignItems: "flex-start",
      backgroundColor: "white",
      borderBottomWidth: "1",
      borderBottomColor: Theme.colors("gray", 300),
      paddingHorizontal: Theme.spacing(6)
    )
    style(
      id: "new-field",
      fontSize: Theme.font_size("base")
    )
    style(
      id: "new-field-error",
      color: Theme.colors("red", 600),
      fontSize: Theme.font_size("sm"),
      paddingTop: Theme.spacing(0.5)
    )
    style(
      id: "form-flash-container",
      width: "100%",
      height: Theme.spacing(14),
      flexDirection: "column",
      justifyContent: "center",
      alignItems: "center",
      backgroundColor: "white",
      paddingHorizontal: Theme.spacing(6)
    )
  end

  def render_header
    text "Close", style: "header-button" do
      behavior trigger: "press", action: "close"
    end
  end

  def render_content
    form style: "form-container" do
      view id: "form-fields" do
        mount NewFormFieldsComponent, create_contact: create_contact
      end

      view style: "action-group" do
        view style: "button" do
          behavior(
            trigger: "press",
            action: "replace-inner",
            target: "form-fields",
            verb: "post",
            href: Contacts::Create.path
          )
          text "Save", style: "button-label"
        end
      end
    end
  end
end
