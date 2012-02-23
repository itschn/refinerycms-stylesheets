module Refinery
  module Stylesheets
    class Stylesheet < Refinery::Core::BaseModel
      self.table_name = :refinery_stylesheets

      acts_as_indexed fields: [:name, :content, :style_type]

      validates :name, :content, :style_type, presence: true

      def to_param
        "#{id}-#{updated_at.to_i}"
      end

      def self.find_by_param(param)
        find(param.split('-').first)
      end
    end
  end
end
