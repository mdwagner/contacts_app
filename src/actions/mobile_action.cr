abstract class MobileAction < Lucky::Action
  include Lucky::EnforceUnderscoredRoute
  include LuckyHXML::Renderable

  accepted_formats [:xml], default: :xml
end
