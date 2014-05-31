require 'spec_helper'

describe ConsumerComplaint do
  # Model & Factory Validation
  #----------------------------------------------------------------------------
  describe "factory validation", :factory_validation => true do
    describe "payment factory" do
      it_behaves_like "valid record", :consumer_complaint
    end
  end

  # Database
  #----------------------------------------------------------------------------
  describe "database", :database => true do
    it { should have_db_column(:id) }
    it { should have_db_column(:consumer_finance_gov_ref_num) }
    it { should have_db_column(:product) }
    it { should have_db_column(:sub_product) }
    it { should have_db_column(:company) }
    it { should have_db_column(:issue) }
    it { should have_db_column(:state) }
    it { should have_db_column(:zip_code) }
    it { should have_db_column(:submission_channel) }
    it { should have_db_column(:received_on) }
    it { should have_db_column(:sent_to_company_on) }
    it { should have_db_column(:company_response) }
    it { should have_db_column(:timely_response) }
    it { should have_db_column(:created_at) }
    it { should have_db_column(:updated_at) }
  end


  # Associations
  #----------------------------------------------------------------------------
  describe "associations", :associations => true do
  end

  # Attributes
  #----------------------------------------------------------------------------
  describe "attributes", :attributes => true do
  end

  # Public Methods
  #----------------------------------------------------------------------------
  describe "public methods", :public_methods => true do
  end
end
