# == Schema Information
#
# Table name: zip_codes
#
#  id                                     :integer      not null, primary key
#  zip_code                               :string       not null, index
#  median_income                          :decimal
#  population                             :integer
#  created_at                             :datetime     not null
#  updated_at                             :datetime     not null

class ZipCode < ActiveRecord::Base
  # Associations
  #----------------------------------------------------------------------------

  # Attributes
  #----------------------------------------------------------------------------
  attr_accessible :zip_code, :median_income, :population

  # Validations
  #----------------------------------------------------------------------------
  validates :zip_code, :presence => true
  validates :median_income, :presence => true
  validates :population, :presence => true

  # Class Methods
  #----------------------------------------------------------------------------

  # Public Methods
  #----------------------------------------------------------------------------

  # Private Methods
  #----------------------------------------------------------------------------
private
end
