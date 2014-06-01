class AddZipCodeDataToConsumerComplaints < ActiveRecord::Migration
  def up
    add_column :consumer_complaints, :zip_code_median_income, :decimal
    add_column :consumer_complaints, :zip_code_population, :integer
    ConsumerComplaint.reset_column_information
    ConsumerComplaint.all.each do |l|
      matched_zip = ZipCode.find_by_zip_code(l.zip_code)

      if matched_zip
        l.update_attribute :zip_code_median_income, matched_zip.median_income
        l.update_attribute :zip_code_population, matched_zip.population
      end
    end
  end

  def down
    remove_column :consumer_complaints, :zip_code_median_income
    remove_column :consumer_complaints, :zip_code_population
  end
end
