# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Stylesheets" do
    describe "Admin" do
      describe "stylesheets" do
        login_refinery_user

        describe "stylesheets list" do
          before(:each) do
            FactoryGirl.create(:stylesheet, :name => "UniqueTitleOne")
            FactoryGirl.create(:stylesheet, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.stylesheets_admin_stylesheets_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.stylesheets_admin_stylesheets_path

            click_link "Add New Stylesheet"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              fill_in "stylesheet_content", :with => "//test contents"
              fill_in "Style Type", :with => "css"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Stylesheets::Stylesheet.count.should == 1
            end
          end

          context "invalid data" do

            it "should fail" do
              pending "form_action partial failure"
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Stylesheets::Stylesheet.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:stylesheet, :name => "UniqueTitle") }

            it "should fail" do
              pending "form_action partial failure"
              visit refinery.stylesheets_admin_stylesheets_path

              click_link "Add New Stylesheet"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Stylesheets::Stylesheet.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:stylesheet, :name => "A name") }

          it "should succeed" do
            visit refinery.stylesheets_admin_stylesheets_path

            within ".actions" do
              click_link "Edit this stylesheet"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:stylesheet, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.stylesheets_admin_stylesheets_path

            click_link "Remove this stylesheet forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Stylesheets::Stylesheet.count.should == 0
          end
        end

      end
    end
  end
end
