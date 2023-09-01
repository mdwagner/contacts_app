class CORSHandler
  include HTTP::Handler

  def call(context)
    context.response.headers["Access-Control-Allow-Origin"] = "*"
    context.response.headers["Access-Control-Allow-Credentials"] = "true"
    context.response.headers["Access-Control-Allow-Headers"] = "DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range,x-hyperview-dimensions,x-hyperview-version,pragma,expires"
    context.response.headers["Access-Control-Allow-Methods"] = "*"

    if context.request.method == "OPTIONS"
      context.response.status = HTTP::Status::NO_CONTENT
      context.response.headers["Access-Control-Max-Age"] = "#{20.days.total_seconds.to_i}"
      context.response.headers["Content-Type"] = "text/plain"
      context.response.headers["Content-Length"] = "0"
      context
    else
      call_next(context)
    end
  end
end
