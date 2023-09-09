class Contacts::EditScreen < MainScreen
  needs contact : Contact
  needs update_contact : UpdateContact

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
      id: "edit-field-container",
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
      id: "edit-field",
      fontSize: Theme.font_size("base")
    )
    style(
      id: "edit-field-error",
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
    style(
      id: "form-flash-error",
      color: Theme.colors("red", 600),
      fontSize: Theme.font_size("sm")
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
      id: "button-label-delete",
      color: Theme.colors("red", 600)
    )
  end

  def render_header
    text "Back", style: "header-button" do
      behavior trigger: "press", action: "back", href: "#"
    end
  end

  def render_content
    form_for(Contacts::Update.with(contact_id: contact.id), style: "form-container") do |href, verb|
      view id: "form-fields" do
        mount Contacts::EditFormFieldsComponent,
          contact: contact,
          update_contact: update_contact
      end

      view style: "action-group" do
        view style: "button" do
          behavior(
            trigger: "press",
            action: "replace-inner",
            target: "form-fields",
            verb: verb,
            href: href
          )
          text "Save", style: "button-label"
        end

        view style: "button" do
          behavior(
            trigger: "press",
            action: "reload",
            href: Contacts::Show.with(contact_id: contact.id).path
          )
          text "Cancel", style: "button-label"
        end

        form_for(Contacts::Delete.with(contact_id: contact.id)) do |delete_href, delete_verb|
          view style: "button" do
            behavior trigger: "press", action: "alert" do
              hyperview_alert_namespace
              alert_title "Confirm delete"
              alert_message "Are you sure you want to delete #{contact.first}?"
              alert_option "Confirm" do
                behavior(
                  trigger: "press",
                  action: "replace-inner",
                  target: "form-flash",
                  href: delete_href,
                  verb: delete_verb
                )
              end
              alert_option "Cancel"
            end
            text "Delete", style: "button-label button-label-delete"
          end
        end
      end
    end
  end
end
