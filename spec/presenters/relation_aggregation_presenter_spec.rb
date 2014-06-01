require 'spec_helper'

describe RelationAggregationPresenter do
  let(:relation) { ConsumerComplaintQuery.new.in }

  before(:each) do
    21.times { FactoryGirl.create(:consumer_complaint, :state => "SC", :product => "Credit", :received_on => Date.new(2012, 1, 2)) }
    19.times { FactoryGirl.create(:consumer_complaint, :state => "SC", :product => "Lease", :received_on => Date.new(2012, 1, 3)) }
    21.times { FactoryGirl.create(:consumer_complaint, :state => "NC", :product => "Mortgage", :received_on => Date.new(2012, 1, 4)) }
    16.times { FactoryGirl.create(:consumer_complaint, :state => "NC", :product => "Credit", :received_on => Date.new(2012, 1, 5)) }
    30.times { FactoryGirl.create(:consumer_complaint, :state => "CA", :product => "Lease", :received_on => Date.new(2012, 1, 5)) }
    23.times { FactoryGirl.create(:consumer_complaint, :state => "CA", :product => "Mortgage", :received_on => Date.new(2012, 1, 6)) }
  end

  before(:each) do
    # ConsumerComplaint.all.each do |c|
    #   if c.product == "Credit"
    #     stubbed_value = 4
    #   elsif c.product == "Lease"
    #     stubbed_value = 3
    #   else
    #     stubbed_value = 2
    #   end

    #   c.stub(:severity_score).and_return(5)
    # end
  end

  subject { described_class.new(relation) }

  describe "records_by_group", :records_by_group => true do
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

  describe "severity_by_group", :severity_by_group => true do
    context "with state" do
      it "returns correct result" do
        subject.severity_by_group(:state).should eq({"CA" => 2, "NC" => 2, "SC" => 2})
      end
    end

    context "with product" do
      it "returns correct result" do
        subject.severity_by_group(:product).should eq({"Credit" => 2, "Mortgage" => 2, "Lease" => 2})
      end
    end
  end

  describe "trends_by_group", :trends_by_group => true do
    context "with state and received_on" do
      it "returns correct result" do
        subject.trends_by_group(:state, :received_on).should eq(
          [
            { "SC" => {"2012-01-02"=>21, "2012-01-03"=>19, "2012-01-04"=>0, "2012-01-05"=>0, "2012-01-06"=>0} },
            { "NC" => {"2012-01-02"=>0, "2012-01-03"=>0, "2012-01-04"=>21, "2012-01-05"=>16, "2012-01-06"=>0} },
            { "CA" => {"2012-01-02"=>0, "2012-01-03"=>0, "2012-01-04"=>0, "2012-01-05"=>30, "2012-01-06"=>23} }
          ]
        )
      end
    end
  end
end
