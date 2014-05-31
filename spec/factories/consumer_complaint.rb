require 'factory_girl'

FactoryGirl.define do
  factory :consumer_complaint, class: ConsumerComplaint do
    sequence(:consumer_finance_gov_ref_num, 1000) { |n| "38787#{n}" }
    product "Bank account or service"
    sub_product "Checking account"
    company "U.S. Bancorp"
    issue "Account opening, closing, or management"
    state "NY"
    zip_code "10013"
    submission_channel "Web"
    received_on { Date.new(2011, 3, 4) }
    sent_to_company_on { Date.new(2011, 4, 4) }
    company_response "In progress"
    timely_response { true }
  end
end
