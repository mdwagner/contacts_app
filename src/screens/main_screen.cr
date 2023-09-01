abstract class MainScreen
  abstract def render(xml)

  def to_s(io)
    XML.build_fragment(io) do |xml|
      render(xml)
    end
  end
end
