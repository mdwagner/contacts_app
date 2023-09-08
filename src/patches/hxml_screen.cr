require "./hxml_builder"

abstract class Lucky::HXMLScreen
  include Lucky::HXMLBuilder

  needs context : HTTP::Server::Context

  abstract def render

  def android? : Bool
    context.request.headers["x-hyperview-platform"]? == "android"
  end

  def ios? : Bool
    context.request.headers["x-hyperview-platform"]? == "ios"
  end
end
