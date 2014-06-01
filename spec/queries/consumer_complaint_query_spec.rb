require 'spec_helper'

describe ConsumerComplaintQuery do
  let!(:complaint_1) { FactoryGirl.create(:consumer_complaint, :state => "VA", :product => "Mortgage") }
  let!(:complaint_2) { FactoryGirl.create(:consumer_complaint, :state => "VA", :product => "Bank") }
  let!(:complaint_3) { FactoryGirl.create(:consumer_complaint, :state => "VA", :product => "Bank") }
  let!(:complaint_4) { FactoryGirl.create(:consumer_complaint, :state => "VA", :product => "Mortgage") }
  let!(:complaint_5) { FactoryGirl.create(:consumer_complaint, :state => "NC", :product => "Mortgage") }
  let!(:complaint_6) { FactoryGirl.create(:consumer_complaint, :state => "NC", :product => "Bank") }
  let!(:complaint_7) { FactoryGirl.create(:consumer_complaint, :state => "NC", :product => "Mortgage") }

  subject { described_class.new }

  describe "in" do
    context "without state" do
      it "returns all complaints for nil" do
        subject.in.should eq(
          [
            complaint_1,
            complaint_2,
            complaint_3,
            complaint_4,
            complaint_5,
            complaint_6,
            complaint_7
          ]
        )
      end      
    end

    context "with state" do
      it "returns all VA complaints for VA" do
        subject.in("VA").should eq(
          [
            complaint_1,
            complaint_2,
            complaint_3,
            complaint_4
          ]
        )
      end
    end
  end

  describe "by_state_and_product" do
    context "without state or product" do
      it "returns all complaints for nil" do
        subject.by_state_and_product.should eq(
          [
            complaint_1,
            complaint_2,
            complaint_3,
            complaint_4,
            complaint_5,
            complaint_6,
            complaint_7
          ]
        )
      end      
    end

    context "product only" do
      it "returns all Mortgage complaints for Mortgage" do
        subject.by_state_and_product(nil, "Mortgage").should eq(
          [
            complaint_1,
            complaint_4,
            complaint_5,
            complaint_7
          ]
        )
      end
    end

    context "with state and product" do
      it "returns all VA complaints for VA" do
        subject.by_state_and_product("VA", "Bank").should eq(
          [
            complaint_2,
            complaint_3
          ]
        )
      end
    end
  end
end