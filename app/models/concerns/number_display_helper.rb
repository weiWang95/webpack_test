module NumberDisplayHelper
  extend ActiveSupport::Concern

  module ClassMethods
    def number_display_methods(*columns, **opts)
      columns.each do |column|
        define_method "display_#{column}" do
          number_to_currency(column.to_f, opts)
        end
      end
    end
  end
end