class PrimaryButton < BaseComponent
  def render(&)
    tag_defaults class: "w-24 rounded-md bg-slate-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-slate-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-slate-600 hover:cursor-pointer" do |tag_builder|
      yield tag_builder
    end
  end
end
