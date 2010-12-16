require 'spec_helper'

FAKE_APP_KEY    = '28d3da80bf36fad415ab57b3130c6cb6'
FAKE_APP_SECRET = 'B66F956ED83AE218612CB0FBAC2EF01C'
TEST_APP_KEY    = ENV['BIGDOOR_API_KEY']    || FAKE_APP_KEY
TEST_APP_SECRET = ENV['BIGDOOR_API_SECRET'] || FAKE_APP_SECRET

module BigDoor 
    describe Currency do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
        end
        context "Currency class" do
            it "Should respond to :all" do 
                BigDoor::Currency.should respond_to(:all).with(1).arguments
            end
            it "Should load 0 currencies at the beginning" do
                currencies = BigDoor::Currency.all( @client )
                currencies.should be_a_instance_of( Array )
                currencies.should be_empty
            end
        end
        context "fresh Currency object" do 
            subject { BigDoor::Currency.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::Currency )}
            it { should respond_to(:save).with(1).arguments }
            it "Should save object successfully" do
                subject.save( @client )
            end
            it "Should have ID after save" do
                subject.should respond_to('resource_id').with(0).arguments
            end
            it { should respond_to(:load).with(2).arguments }
            it { should respond_to(:remove).with(2).arguments }
        end
    end
end
