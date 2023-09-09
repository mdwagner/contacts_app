class HXMLLogHandler
  include HTTP::Handler

  def call(context)
    if context.request.headers.includes_word?("Accept", "application/xml")
      context.response.output = HXMLLog.new(context.response.output, context)
    end
    call_next(context)
  end

  private class HXMLLog < IO
    def initialize(@io : IO, @content : HTTP::Server::Context)
    end

    def read(slice : Bytes)
      raise NotImplementedError.new("read")
    end

    def write(slice : Bytes) : Nil
      File.write("./hxml_log", slice, mode: "a")
      @io.write(slice)
    end

    def flush
      @io.flush
    end

    def close
      @io.close
    end
  end
end
