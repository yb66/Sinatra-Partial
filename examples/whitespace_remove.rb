# encoding: UTF-8

## Here to strip out whitespace, because ERB (can you believe it?) doesn't use whitespace well. Many thanks to http://stackoverflow.com/questions/8827845/how-do-i-strip-html-whitespace-in-erb-templates#answer-8828830
class WhiteSpaceRemove
  def initialize(app, options = {})
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)

    if headers["Content-Type"] =~ /\bhtml\b/
      response[0] = response[0].gsub(/\s*(<[^>]+>)\s*/, '\1')
      headers["Content-Length"] = response[0].size.to_s
    end

    [status, headers, response]
  end
end