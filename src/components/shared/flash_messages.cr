class Shared::FlashMessages < BaseComponent
  needs flash : Lucky::FlashStore

  def render
    flash.each do |_, flash_message|
      div class: "pointer-events-auto ml-auto max-w-fit mb-4 overflow-hidden rounded-lg bg-white shadow-lg ring-1 ring-black ring-opacity-5",
        x_data: "{ show: true }", x_init: "setTimeout(() => show = false, 3000)", x_show: "show", attrs: [:"x-transition.duration.500ms"] do
        div class: "p-4" do
          div class: "flex items-center" do
            text flash_message
          end
        end
      end
    end
  end
end
