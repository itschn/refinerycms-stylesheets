require 'spec_helper'

module Refinery
  module Stylesheets
    describe Stylesheet do
      describe "validations" do
        %w(name content style_type).each do |attribute|
          it "should validate presence of #{attribute}" do
            subject.should have(1).errors_on(attribute)
          end
        end
      end
    end
  end
end
