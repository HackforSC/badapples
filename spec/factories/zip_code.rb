require 'factory_girl'

FactoryGirl.define do
  factory :zip_code, class: ZipCode do
    sequence(:zip_code, 90000) { |n| "#{n}" }
    median_income 35100.00
    population 25004
  end
end
