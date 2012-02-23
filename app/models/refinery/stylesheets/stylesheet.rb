module Refinery
  module Stylesheets
    class Stylesheet < Refinery::Core::BaseModel
      self.table_name = :refinery_stylesheets      
    
      acts_as_indexed fields: [:name, :content, :style_type]

      validates :name, :content, :style_type, presence: true

    end
  end
end
