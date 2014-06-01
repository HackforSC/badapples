require 'spec_helper'

describe ComplaintQueryPresenter do
  let(:relation) { ConsumerComplaintQuery.new.in_state }
  before(:each) do
    40.times { FactoryGirl.create(:consumer_complaint, :state => "SC") }
    37.times { FactoryGirl.create(:consumer_complaint, :state => "NC") }
    53.times { FactoryGirl.create(:consumer_complaint, :state => "CA") }
  end

  subject { described_class.new(relation) }

  its(:records_by_state) { should eq({"CA"=>53, "NC"=>37, "SC"=>40}) }
end
