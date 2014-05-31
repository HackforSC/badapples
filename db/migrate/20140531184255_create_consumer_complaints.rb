class CreateConsumerComplaints < ActiveRecord::Migration
  def change
    create_table :consumer_complaints do |t|
      t.string :consumer_finance_gov_ref_num,       :null => false
      t.string :product,                            :null => false
      t.string :sub_product,                        :null => false
      t.string :company,                            :null => false
      t.string :issue,                              :null => false
      t.string :state,                              :null => false
      t.string :zip_code,                           :null => false
      t.string :submission_channel,                 :null => false
      t.date   :received_on,                        :null => false
      t.date   :sent_to_company_on,                 :null => false
      t.string :company_response,                   :null => false
      t.boolean :timely_response,                   :null => false

      t.timestamps
    end
  end
end
