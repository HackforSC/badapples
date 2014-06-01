class CreateConsumerComplaints < ActiveRecord::Migration
  def change
    create_table :consumer_complaints do |t|
      t.string :consumer_finance_gov_ref_num,       :null => false
      t.string :product
      t.string :sub_product
      t.string :company
      t.string :issue
      t.string :state
      t.string :zip_code
      t.string :submission_channel
      t.date   :received_on
      t.date   :sent_to_company_on
      t.string :company_response
      t.boolean :timely_response

      t.timestamps
    end
  end
end
