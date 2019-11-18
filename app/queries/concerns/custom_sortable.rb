module CustomSortable
  extend ActiveSupport::Concern

  included do |base|
    base.instance_variable_set("@_sort_options", {})
    base.instance_variable_set("@_sort_columns", [])
    base.instance_variable_set("@_sort_directions", %w(asc desc))
  end

  def custom_sort!(relations, **opts)
    opts[:sort_by] = self.class.sort_options[:default_by] if opts[:sort_by].blank?
    opts[:sort_direction] = self.class.sort_options[:default_direction] if opts[:sort_direction].blank?

    return relations unless self.class.check_sort_parameter_validate(opts[:sort_by].to_s, opts[:sort_direction].to_s)

    order_method = self.class.sort_options[:reorder] ? :reorder : :order
    relations.send(order_method, "#{opts[:sort_by]} #{opts[:sort_direction]}")
  end

  module ClassMethods
    def sort_columns(*columns)
      opts = columns.extract_options!
      @_sort_options[:default_by]        = opts[:default_by].to_s
      @_sort_options[:default_direction] = opts[:default_direction].to_s
      @_sort_options[:reorder]           = opts[:reorder]

      @_sort_columns = columns.map(&:to_s)
    end

    def check_sort_parameter_validate(sort_by, sort_direction)
      (sort_by.blank? || @_sort_columns.include?(sort_by)) && @_sort_directions.include?(sort_direction)
    end

    def sort_options
      @_sort_options
    end
  end
end
