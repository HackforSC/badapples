require 'spec_helper'

describe SeverityModel do
  let!(:complaint_1) { FactoryGirl.create(:consumer_complaint, :state => "VA", :product => "Mortgage") }
  let!(:complaint_2) { FactoryGirl.create(:consumer_complaint, :state => "VA", :product => "Bank") }

  context "with high severity and low income" do
    let(:object) { FactoryGirl.create(:consumer_complaint) }
    before(:each) { object.stub(:severity).and_return("high") }
    before(:each) { object.stub(:zip_code_median_income).and_return(15500) }

    subject { described_class.new(object) }

    its(:score) { should eq(6) }
  end

  context "with medium severity and medium income" do
    let(:object) { FactoryGirl.create(:consumer_complaint) }
    before(:each) { object.stub(:severity).and_return("medium") }
    before(:each) { object.stub(:zip_code_median_income).and_return(35500) }

    subject { described_class.new(object) }

    its(:score) { should eq(4) }
  end

  context "with low severity and high income" do
    let(:object) { FactoryGirl.create(:consumer_complaint) }
    before(:each) { object.stub(:severity).and_return("low") }
    before(:each) { object.stub(:zip_code_median_income).and_return(115500) }

    subject { described_class.new(object) }

    its(:score) { should eq(1) }
  end
end