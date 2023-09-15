abstract class MobileAction < Lucky::Action
  include Lucky::EnforceUnderscoredRoute
  include Lucky::HXMLRenderable

  accepted_formats [:xml], default: :xml
end
