require 'spec_helper'

FAKE_APP_KEY    = '28d3da80bf36fad415ab57b3130c6cb6'
FAKE_APP_SECRET = 'B66F956ED83AE218612CB0FBAC2EF01C'
TEST_APP_KEY    = ENV['BIGDOOR_API_KEY']    || FAKE_APP_KEY
TEST_APP_SECRET = ENV['BIGDOOR_API_SECRET'] || FAKE_APP_SECRET

module BigDoor 
    describe Award do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
        end
        context "fresh Award object" do 
            subject { BigDoor::Award.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::Award )}
        end
        context "Award class" do
            it "Should respond to :all" do 
                BigDoor::Award.should respond_to(:all).with(1).arguments
            end
        end
    end
end
