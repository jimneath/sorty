module Sorty
  module Sort
    extend ActiveSupport::Concern
    
    module ClassMethods
      def sorty(params)
        return scoped if params[:column].blank?

        column = params[:column].dup
        direction = params[:direction] || 'asc'
        relation = column[/^(.*)\./, 1]

        if relation && self.reflections.has_key?(relation.to_sym)
          column.gsub!(/#{relation}\./, "#{self.reflections[relation.to_sym].klass.table_name}.")
          query = includes(relation.to_sym)
        else
          column = "#{table_name}.#{column}"
          query = scoped
        end

        query.order("#{column} #{direction}")
      end
    end
  end
end