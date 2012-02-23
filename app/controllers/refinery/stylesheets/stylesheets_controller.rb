module Refinery
  module Stylesheets
    class StylesheetsController < ::ApplicationController
      layout nil
      def show
        @stylesheet = Stylesheet.find(params[:id])
        render text: @stylesheet.content.html_safe, content_type: "text/css"
      end
    end
  end
end
