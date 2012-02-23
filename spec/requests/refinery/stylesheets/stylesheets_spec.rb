require "spec_helper"

describe Refinery do
  describe "Stylesheets" do
    let(:stylesheet) { FactoryGirl.create(:stylesheet, content: '// comments' ) }
    login_refinery_user
    before do
      visit refinery.stylesheets_stylesheet_path stylesheet
    end

    it 'shows the content in the stylesheet' do
      page.should have_content('// comments')
    end

    it 'should have content type of text/css' do
      page.response_headers['Content-Type'].should =~ %r(text/css)
    end

  end
end
