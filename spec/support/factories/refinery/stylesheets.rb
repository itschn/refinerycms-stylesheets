
FactoryGirl.define do
  factory :stylesheet, :class => Refinery::Stylesheets::Stylesheet do
    sequence(:name) { |n| "refinery#{n}" }
    style_type 'css'
    content '//comments'
  end
end

