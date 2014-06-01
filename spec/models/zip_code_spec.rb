require 'spec_helper'

describe ZipCode do
  # Model & Factory Validation
  #----------------------------------------------------------------------------
  describe "factory validation", :factory_validation => true do
    describe "zip_code factory" do
      it_behaves_like "valid record", :zip_code
    end
  end

  # Database
  #----------------------------------------------------------------------------
  describe "database", :database => true do
    it { should have_db_column(:id) }
    it { should have_db_column(:zip_code) }
    it { should have_db_column(:median_income) }
    it { should have_db_column(:population) }
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
