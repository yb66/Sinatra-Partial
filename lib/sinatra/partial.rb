# encoding: UTF-8

require 'sinatra/base'

module Sinatra
  module Partial
    
    # Renders a partial to a string
    # 
    # @param [#to_s] partial the partial to render
    # @param [Hash] options the options to render the partial with
    # @option options [Hash] :locals local variables to render with
    # @option options [Array] :collection renders the template once per object in this array
    # @option options [Symbol] :template_engine the template engine to use. Haml by default
    #
    # @return [String] the rendered template contents
    #
    # @example simply render a partial
    #   partial(:meta, :locals => {meta: meta})
    #     # => renders views/_meta.haml
    #
    # @example render a partial in a subfolder
    #   partial("meta/news", :locals => {news: [<News>]})
    #     # => renders views/meta/_news.haml
    #
    # @example render a collection of objects with one partial
    #   partial(:"meta/news", :collection => [<News>])
    #     # => renders views/meta/_news.haml once per item in :collection,
    #           with the local variable `news` being the current item in the iteration
    #
    # @see https://gist.github.com/119874
    def partial(partial, options={})
      partial_location = partial.to_s
      
      locals = options.fetch(:locals, {})
      engine = options.fetch(:template_engine, :haml)
      
      template = partial_expand_path(partial_location)
      
      if collection = options.delete(:collection)
        member_local = partial_local(partial_location)

        collection.inject([]) do |buffer, member|
          new_locals = {member_local => member}.merge(locals)
          buffer << self.method(engine).call(template, options.merge(:locals => new_locals))
        end.join("\n")
      else
        self.method(engine).call(template, options)
      end
    end
    
    private
    
    def partial_expand_path(partial_path)
      parts = partial_path.split("/")
      parts.last.insert(0, "_")
      parts.join("/").to_sym
    end
    
    def partial_local(partial_path)
      name.split("/").last.to_sym
    end
  end

  helpers Partial
end


