class Shared::FlashMessages < BaseComponent
  needs flash : Lucky::FlashStore

  def render
    flash.each do |flash_type, flash_message|
      render_flash_container do
        text flash_message
      end
    end
  end

  private def render_flash_container(&)
    div class: "pointer-events-auto mr-auto max-w-fit mb-4 overflow-hidden rounded-lg bg-white shadow-lg ring-1 ring-black ring-opacity-5" do
      div class: "p-4" do
        div class: "flex items-center" do
          yield
        end
      end
    end
  end
end
