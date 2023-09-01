class EmailErrorComponent < BaseComponent
  needs email : String

  def render
    div class: "mt-2 text-sm text-red-600" do
      text "Email already exists"
    end
  end
end
