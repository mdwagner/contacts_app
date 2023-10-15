class Mobile::SwipeRowComponent < BaseHXMLComponent
  def render(&)
    element "swipe:row" do
      swipe_namespace
      yield
    end
  end

  private def swipe_namespace : Nil
    attribute "xmlns:swipe", "https://hypermedia.systems/hyperview/swipeable"
  end
end
