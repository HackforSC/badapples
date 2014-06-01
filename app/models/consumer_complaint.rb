# == Schema Information
#
# Table name: consumer_complaints
#
#  id                                     :integer      not null, primary key
#  consumer_finance_gov_ref_num           :integer      not null, index
#  product                                :string       not null
#  sub_product                            :string       not null
#  company                                :string       not null
#  issue                                  :string       not null
#  state                                  :string       not null
#  zip_code                               :string       not null
#  submission_channel                     :string       not null
#  received_on                            :date         not null
#  sent_to_company_on                     :date         not null
#  company_response                       :string       not null
#  timely_response                        :boolean      not null
#  zip_code_median_income                 :decimal      not null
#  zip_code_population                    :integer      not null
#  created_at                             :datetime     not null
#  updated_at                             :datetime     not null

class ConsumerComplaint < ActiveRecord::Base
  # Attributes
  #----------------------------------------------------------------------------
  attr_accessible :consumer_finance_gov_ref_num, 
                  :product, :sub_product,
                  :company, :issue, :state, :zip_code, 
                  :submission_channel, :received_on,
                  :sent_to_company_on, :company_response
                  :timely_response

  # Validations
  #----------------------------------------------------------------------------
  # validates :customer_number, :presence => true

  def high_severity_issues
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
  end

  def medium_severity_issues
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
  end

  def low_severity_issues
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
  end

  def severity
    if high_severity_issues.include?(issue)
      "high"
    elsif medium_severity_issues.include?(issue)
      "medium"
    elsif low_severity_issues.include?(issue)
      "low"
    else
      "other"
    end
  end

  def high_severity?
    severity == "high"
  end

  def medium_severity?
    severity == "medium"
  end

  def low_severity?
    severity == "low"
  end

  def other_severity?
    severity == "other"
  end

  def severity_score
    SeverityModel.new(self).score
  end

  # Private Methods
  #----------------------------------------------------------------------------
private
end
