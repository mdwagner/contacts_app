class Mobile::SwipeMainComponent < BaseHXMLComponent
  def render(&)
    element "swipe:main" do
      yield
    end
  end
end
