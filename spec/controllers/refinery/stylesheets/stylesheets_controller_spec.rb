require 'spec_helper'

module Refinery
  module Stylesheets
    describe StylesheetsController do
      login_refinery_user

      describe '#show' do
        let!(:stylesheet) { FactoryGirl.create(:stylesheet, content: '// comments', id: 100) }

        it 'should be cached' do
          get :show, id: stylesheet.to_param
          response.body.should match /\/\/ comments/
        end
      end
    end
  end
end

