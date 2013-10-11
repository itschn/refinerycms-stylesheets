module Refinery
  module Stylesheets
    class StylesheetsController < ::ActionController::Base
      caches_page :show
      layout nil
      def show
        @stylesheet = Stylesheet.find_by_param(params[:id])
        render text: @stylesheet.content.html_safe, content_type: "text/css"
      end
    end
  end
end
