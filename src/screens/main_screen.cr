abstract class MainScreen < Lucky::HXMLScreen
  def lr_ns_attr : Nil
    attribute "xmlns:lr", "http://dev.localhost/livereload"
  end
end
