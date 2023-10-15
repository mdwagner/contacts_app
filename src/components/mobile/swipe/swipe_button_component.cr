class Mobile::SwipeButtonComponent < BaseHXMLComponent
  def render(&)
    element "swipe:button" do
      yield
    end
  end
end
