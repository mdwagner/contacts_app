require "./hxml_tags"

module Lucky::HXMLBuilder
  include ::Lucky::Assignable
  include Lucky::HXMLTags

  property! xml : XML::Builder

  delegate element, attribute, to: xml

  abstract def render

  def perform_render(**args) : String
    XML.build_fragment(**args) do |xml|
      self.xml = xml
      render
    end
  end
end
