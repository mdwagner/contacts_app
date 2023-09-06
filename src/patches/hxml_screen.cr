require "./hxml_builder"

abstract class Lucky::HXMLScreen
  include Lucky::HXMLBuilder

  needs context : HTTP::Server::Context

  abstract def render
end
