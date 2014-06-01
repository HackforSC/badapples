class CreateZipCodes < ActiveRecord::Migration
  def change
    create_table :zip_codes do |t|
      t.string :zip_code,       :null => false
      t.decimal :median_income
      t.integer :population

      t.timestamps
    end
  end
end
