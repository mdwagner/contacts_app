require "./hxml_builder"

abstract class Lucky::HXMLScreen
  include Lucky::HXMLBuilder
  include Lucky::HXMLFormHelpers
  include Lucky::HXMLRequestHelpers
  include Lucky::HXMLMountComponent

  needs context : HTTP::Server::Context

  abstract def render
end
