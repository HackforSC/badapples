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
    it { should have_db_column(:zip_code_median_income) }
    it { should have_db_column(:zip_code_population) }
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
    describe "#high_severity_issues", :high_severity_issues => true do
      it "should return correct array" do
        described_class.new.high_severity_issues.should eq(
          [
            "Improper contact or sharing of info", 
            "Cont'd attempts collect debt not owed",
            "Taking/threatening an illegal action", 
            "False statements or representation",
            "Communication tactics", 
            "Credit reporting company's investigation", 
            "Settlement process and costs", 
            "Improper use of my credit report", 
            "Identity theft / Fraud / Embezzlement", 
            "Unsolicited issuance of credit card",
            "Money was not available when promised",
            "Fraud or scam",
            "Wrong amount charged or received"
          ]
        )
      end
    end

    describe "#medium_severity_issues", :medium_severity_issues => true do
      it "should return correct array" do
        described_class.new.medium_severity_issues.should eq(
          [
            "Disclosure verification of debt", 
            "Loan servicing, payments, escrow account",
            "APR or interest rate", 
            "Unable to get credit report/credit score", 
            "Incorrect information on credit report", 
            "Billing disputes", 
            "Managing the loan or lease", 
            "Credit monitoring or identity protection", 
            "Customer service / Customer relations",
            "Forbearance / Workout plans", 
            "Credit card protection / Debt protection", "Arbitration", 
            "Incorrect/missing disclosures or info", 
            "Application processing delay", 
            "Repaying your loan",
            "Late fee", 
            "Transaction issue", 
            "Overlimit fee",
            "Cash advance", 
            "Balance transfer", 
            "Other fee", 
            "Cash advance fee",
            "Account terms and changes"
          ]
        )
      end
    end

    describe "#low_severity_issues", :low_severity_issues => true do
      it "should return correct array" do
        described_class.new.low_severity_issues.should eq(
          [
            "Can't repay my loan", 
            "Problems when you are unable to pay", 
            "Problems caused by my funds being low", 
            "Account opening, closing, or management", 
            "Loan modification,collection,foreclosure", 
            "Deposits and withdrawals", 
            "Application, originator, mortgage broker", 
            "Making/receiving payments, sending money", 
            "Taking out the loan or lease", 
            "Credit line increase/decrease", 
            "Rewards"
          ]
        )
      end
    end

    describe "#severity", :severity => true do
      subject { described_class.new(:issue => "My issue") }

      context "with high severity" do
        before(:each) { subject.stub(:high_severity_issues).and_return(["My issue"]) }

        it "should return 'high'" do
          subject.severity.should eq("high")
        end
      end

      context "with medium severity" do
        before(:each) { subject.stub(:medium_severity_issues).and_return(["My issue"]) }

        it "should return 'medium'" do
          subject.severity.should eq("medium")
        end
      end

      context "with low severity" do
        before(:each) { subject.stub(:low_severity_issues).and_return(["My issue"]) }

        it "should return 'low'" do
          subject.severity.should eq("low")
        end
      end

      context "with other severity" do
        it "should return 'other'" do
          subject.severity.should eq("other")
        end
      end
    end
  end
end
