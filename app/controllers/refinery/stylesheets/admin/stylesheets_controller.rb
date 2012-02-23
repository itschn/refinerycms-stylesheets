module Refinery
  module Stylesheets
    module Admin
      class StylesheetsController < ::Refinery::AdminController

        crudify :'refinery/stylesheets/stylesheet',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
