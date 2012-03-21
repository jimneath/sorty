module Sorty
  module Helpers
    def sorty(column, options = {})
      options = { :label => column.to_s.humanize.titleize }.merge(options)

      query = params.merge({
        column: column,
        direction: (params[:direction].eql?('asc') ? 'desc' : 'asc')
      })

      if params[:column].eql?(column.to_s)
        options[:label] << (params[:direction].eql?('asc') ? ' &uarr;' : ' &darr;')
      end

      link_to(raw(options[:label]), query)
    end
  end
end