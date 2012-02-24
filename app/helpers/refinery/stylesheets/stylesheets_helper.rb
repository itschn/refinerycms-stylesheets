module Refinery
  module Stylesheets
    module StylesheetsHelper
      def css_for_refinery
        Stylesheet.all.map do |css_file|
          stylesheet_link_tag raw(refinery.stylesheets_stylesheet_path(css_file))
        end.join("\n").html_safe
      end
    end
  end
end
