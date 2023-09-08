module Lucky::HXMLFormHelpers
  def csrf_tag : Nil
    text_field hide: "true", name: get_csrf_name, value: get_csrf_token
  end

  def form_method_override(route) : Nil
    unless [:post, :get].includes?(route.method)
      text_field hide: "true", name: "_method", value: route.method.to_s
    end
  end

  def form_verb(route) : String
    if route.method == :get
      "get"
    else
      "post"
    end
  end

  def get_csrf_name : String
    Lucky::ProtectFromForgery::SESSION_KEY
  end

  def get_csrf_token : String
    Lucky::ProtectFromForgery.get_token(context)
  end
end
