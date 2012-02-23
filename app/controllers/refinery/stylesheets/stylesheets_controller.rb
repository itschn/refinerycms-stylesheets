module Refinery
  module Stylesheets
    class StylesheetsController < ::ApplicationController

      before_filter :find_all_stylesheets
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @stylesheet in the line below:
        present(@page)
      end

      def show
        @stylesheet = Stylesheet.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @stylesheet in the line below:
        present(@page)
      end

    protected

      def find_all_stylesheets
        @stylesheets = Stylesheet.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/stylesheets").first
      end

    end
  end
end
