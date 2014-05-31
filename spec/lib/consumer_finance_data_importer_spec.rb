require 'spec_helper'

describe ConsumerFinanceDataImporter do
  let(:test_file) { "consumer_finance_data_test.xml" }
  let(:file_name) { "#{Rails.root}/lib/#{test_file}" }

  before(:each) { described_class.import(file_name) }

  it "should have new ConsumerComplaint models" do
    ConsumerComplaint.all.count.should eq(2)
  end

  describe "first parsed model" do
    subject { ConsumerComplaint.first }

    it { should be_persisted }
    its(:consumer_finance_gov_ref_num) { should eq("875414") }
    its(:product) { should eq("Bank account or service") }
    its(:sub_product) { should eq("Checking account") }
    its(:company) { should eq("U.S. Bancorp") }
    its(:issue) { should eq("Account opening, closing, or management") }
    its(:state) { should eq("NY") }
    its(:zip_code) { should eq("10013") }
    its(:submission_channel) { should eq("Web") }
    its(:received_on) { should eq(Date.new(2014, 5, 29)) }
    its(:sent_to_company_on) { should eq(Date.new(2014, 5, 30)) }
    its(:company_response) { should eq("In progress") }
    its(:timely_response) { should be_true }
  end

  describe "second parsed model" do
    subject { ConsumerComplaint.last }

    it { should be_persisted }
    its(:consumer_finance_gov_ref_num) { should eq("874457") }
    its(:product) { should eq("Mortgage") }
    its(:sub_product) { should eq("Conventional adjustable mortgage (ARM)") }
    its(:company) { should eq("Flagstar Bank") }
    its(:issue) { should eq("Loan modification,collection,foreclosure") }
    its(:state) { should eq("AZ") }
    its(:zip_code) { should eq("85331") }
    its(:submission_channel) { should eq("Web") }
    its(:received_on) { should eq(Date.new(2014, 5, 30)) }
    its(:sent_to_company_on) { should eq(Date.new(2014, 5, 30)) }
    its(:company_response) { should eq("In progress") }
    its(:timely_response) { should be_false }
  end
end