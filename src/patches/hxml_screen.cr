require "./hxml_builder"

abstract class Lucky::HXMLScreen
  include Lucky::HXMLBuilder

  needs context : HTTP::Server::Context

  def to_s(io)
    io << perform_render
  end
end
