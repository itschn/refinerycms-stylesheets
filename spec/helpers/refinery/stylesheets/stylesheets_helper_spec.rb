require 'spec_helper'

module Refinery
  module Stylesheets
    describe StylesheetsHelper do
      describe "#css_for_refinery" do
        let!(:stylesheet1) { Factory :stylesheet }
        let!(:stylesheet2) { Factory :stylesheet }

        it "should return all paths for custom stylesheets" do
          helper.css_for_refinery.should match stylesheet_link_tag(raw("/stylesheets/stylesheets/#{stylesheet1.to_param}"))
          helper.css_for_refinery.should match stylesheet_link_tag(raw("/stylesheets/stylesheets/#{stylesheet2.to_param}"))
        end
      end
    end
  end
end
