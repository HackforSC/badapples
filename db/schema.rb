# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140531184255) do

  create_table "consumer_complaints", :force => true do |t|
    t.string   "consumer_finance_gov_ref_num", :null => false
    t.string   "product",                      :null => false
    t.string   "sub_product",                  :null => false
    t.string   "company",                      :null => false
    t.string   "issue",                        :null => false
    t.string   "state",                        :null => false
    t.string   "zip_code",                     :null => false
    t.string   "submission_channel",           :null => false
    t.date     "received_on",                  :null => false
    t.date     "sent_to_company_on",           :null => false
    t.string   "company_response",             :null => false
    t.boolean  "timely_response",              :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

end
