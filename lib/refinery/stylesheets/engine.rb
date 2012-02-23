module Refinery
  module Stylesheets
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Stylesheets

      engine_name :refinery_stylesheets

      initializer "register refinerycms_stylesheets plugin" do |app|
        Refinery::Plugin.register do |plugin|
          plugin.name = "stylesheets"
          plugin.url = {
            :controller => 'refinery/stylesheets/admin/stylesheets',
            :action => 'index'
          }
          plugin.pathname = root

          plugin.activity = {
            :class_name => :'refinery/stylesheets/stylesheet',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Stylesheets)
      end
    end
  end
end
