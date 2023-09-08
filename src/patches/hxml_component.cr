require "./hxml_builder"

abstract class Lucky::HXMLComponent
  include Lucky::HXMLBuilder
  include Lucky::HXMLFormHelpers
  include Lucky::HXMLRequestHelpers
  include Lucky::HXMLMountComponent

  needs context : HTTP::Server::Context

  def render(&)
    {% raise "Cannot invoke 'render' with a block until method is overridden" %}
  end

  def render
    {% raise "Cannot invoke 'render' until method is overridden" %}
  end
end
