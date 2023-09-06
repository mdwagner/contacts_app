require "./hxml_tags"

module Lucky::HXMLBuilder
  include Lucky::Assignable
  include Lucky::HXMLTags

  property! xml : XML::Builder

  delegate element, attribute, to: xml

  Habitat.create do
    setting indent : String | Int32 | Nil = nil
    setting quote_char : Char? = nil
  end

  def perform_render(io : IO) : Nil
    XML.build_fragment(io, indent: Lucky::HXMLBuilder.settings.indent, quote_char: Lucky::HXMLBuilder.settings.quote_char) do |xml|
      self.xml = xml
      render
    end
  end

  def perform_render : String
    String.build do |io|
      perform_render(io)
    end
  end

  def to_s(io)
    perform_render(io)
  end

  def mount(component : Lucky::HXMLComponent.class, *args, **named_args, &) : Nil
    component.new(*args, **named_args).tap do |instance|
      instance.xml = self.xml
      instance.render do |*yield_args|
        yield *yield_args
      end
    end
  end

  def mount(component : Lucky::HXMLComponent.class, *args, **named_args) : Nil
    component.new(*args, **named_args).tap do |instance|
      instance.xml = self.xml
      instance.render
    end
  end
end
