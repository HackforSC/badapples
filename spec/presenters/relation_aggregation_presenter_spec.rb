require 'spec_helper'

describe RelationAggregationPresenter do
  let(:relation) { ConsumerComplaintQuery.new.in_state }
  before(:each) do
    21.times { FactoryGirl.create(:consumer_complaint, :state => "SC", :product => "Credit") }
    19.times { FactoryGirl.create(:consumer_complaint, :state => "SC", :product => "Lease") }
    21.times { FactoryGirl.create(:consumer_complaint, :state => "NC", :product => "Mortgage") }
    16.times { FactoryGirl.create(:consumer_complaint, :state => "NC", :product => "Credit") }
    30.times { FactoryGirl.create(:consumer_complaint, :state => "CA", :product => "Lease") }
    23.times { FactoryGirl.create(:consumer_complaint, :state => "CA", :product => "Mortgage") }
  end

  subject { described_class.new(relation) }

  describe "records_by_group" do
    context "with state" do
      it "returns correct result" do
        subject.records_by_group(:state).should eq({"CA" => 53, "NC" => 37, "SC" => 40})
      end
    end

    context "with product" do
      it "returns correct result" do
        subject.records_by_group(:product).should eq({"Credit" => 37, "Mortgage" => 44, "Lease" => 49})
      end
    end
  end
end
