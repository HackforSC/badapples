# == Schema Information
#
# Table name: consumer_complaints
#
#  id                                     :integer      not null, primary key
#  consumer_finance_gov_ref_num           :integer      not null
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
#  created_at                             :datetime     not null
#  updated_at                             :datetime     not null

class ConsumerComplaint < ActiveRecord::Base
  # Associations
  #----------------------------------------------------------------------------

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
  # validates :application_number, :presence => true
  # validates :first_name, :presence => true
  # validates :last_name, :presence => true
  # validates :email, :presence => true
  # validates :date_of_birth, :presence => true
  # validates :social_security_number, :presence => true
  # validates :social_security_number, :social_security_number_format => true, :allow_blank => true
  # validates :encrypted_social_security_number, :presence => true, :symmetric_encryption => true
  # validates :street, :presence => true
  # validates :city, :presence => true
  # validates :state, :presence => true
  # validates :zip_code, :presence => true
  # validates :country, :presence => true
  # validates :street, :presence => true
  # validates :bank_account_number, :length => { :minimum => 3 }, :allow_nil => true
  # validates :encrypted_bank_account_number, :symmetric_encryption => true, :allow_nil => true
  # monetize :monthly_income_cents, :allow_nil => true, :numericality => { :greater_than_or_equal_to => 0 }
  # monetize :payroll_garnishment_cents, :allow_nil => true, :numericality => { :greater_than_or_equal_to => 0 }
  # validates :loan_amount, :presence => true, :numericality => { :allow_nil => false, :greater_than => 0 }
  # monetize :loan_amount_cents, :allow_nil => false, :numericality => { :greater_than => 0 }
  # validates :effective_date, :presence => true
  # validates :due_date, :presence => true


  # Class Methods
  #----------------------------------------------------------------------------

  # Public Methods
  #----------------------------------------------------------------------------

  # Private Methods
  #----------------------------------------------------------------------------
private
end
