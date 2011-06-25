# encoding: UTF-8

require 'sinatra/base'

module Sinatra
  module Partial
    
    # support for partials
    # @example
    #   partial( :meta, :locals => {meta: meta} )
    def partial(template, *args)
      opts = args.last.is_a?(Hash) ? args.pop : {} # get hash options if they're there
      opts.merge!(:layout => false) # don't layout, this is a partial

      if collection = opts.delete(:collection)
        collection.inject([]) do |buffer, member|
          buffer << haml(template, opts.merge(
            :layout => false, 
            :locals => {template.to_sym => member}
            )
          )
        end.join("\n")
      else
        haml(template, opts)
      end
    end # def
  end

  helpers Partial
end


