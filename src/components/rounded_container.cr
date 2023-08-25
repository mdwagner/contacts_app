class RoundedContainer < BaseComponent
  def render
    div class: "max-w-4xl shadow-xl rounded-lg px-6 py-4 bg-white w-[768px]" do
      yield
    end
  end
end
