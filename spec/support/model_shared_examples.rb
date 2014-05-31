module ModelSharedExamples
  # Objects & Errors
  #----------------------------------------------------------------------------
  shared_examples_for "valid record" do |factory|
    describe "on build", :build => true do
      it "builds valid object" do
        object = FactoryGirl.build_stubbed(factory)
        object.should be_valid
      end
    end      

    describe "on create", :create => true do
      it "creates valid record" do
        expect { FactoryGirl.create(factory) }.to_not raise_error
      end
    end
  end
end

RSpec.configure do |config|
  config.extend ModelSharedExamples, :type => :model
end
