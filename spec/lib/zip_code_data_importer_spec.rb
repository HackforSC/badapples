require 'spec_helper'

describe ZipCodeDataImporter do
  let(:test_file) { "median_incomes_by_zip_test.xls" }
  let(:file_name) { "#{Rails.root}/lib/#{test_file}" }

  before(:each) { described_class.import(file_name) }

  it "should have new ZipCode models" do
    ZipCode.all.count.should eq(4)
  end

  describe "first parsed model" do
    subject { ZipCode.first }

    it { should be_persisted }
    its(:zip_code) { should eq("1001") }
    its(:median_income) { should eq(56662.57) }
    its(:population) { should eq(16445) }
  end

  describe "last parsed model" do
    subject { ZipCode.last }

    it { should be_persisted }
    its(:zip_code) { should eq("1005") }
    its(:median_income) { should eq(75423) }
    its(:population) { should eq(4798) }
  end
end
