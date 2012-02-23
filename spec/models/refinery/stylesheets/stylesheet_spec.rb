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

      describe '.find_by_param' do
        let(:stylesheet) { FactoryGirl.create(:stylesheet, content: '// comments' ) }
        it 'should find stylesheet by selecting the id out of param' do
           Stylesheet.find_by_param(stylesheet.to_param).should == stylesheet
        end
      end

      describe '#to_param' do
        let(:now) { Time.now }
        subject { FactoryGirl.create(:stylesheet, content: '// comments', updated_at: now) }

        it 'should return id and timestamp of updated at' do
          subject.to_param.should == "#{subject.id}-#{now.to_i}"
        end
      end
    end
  end
end
