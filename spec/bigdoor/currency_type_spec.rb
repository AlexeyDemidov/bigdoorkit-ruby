require 'spec_helper'

FAKE_APP_KEY    = '28d3da80bf36fad415ab57b3130c6cb6'
FAKE_APP_SECRET = 'B66F956ED83AE218612CB0FBAC2EF01C'
TEST_APP_KEY    = ENV['BIGDOOR_API_KEY']    || FAKE_APP_KEY
TEST_APP_SECRET = ENV['BIGDOOR_API_SECRET'] || FAKE_APP_SECRET

module BigDoor 
    describe CurrencyType do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
        end
        context "CurrencyType class" do
            it "Should respond to :all" do 
                BigDoor::CurrencyType.should respond_to(:all).with(1).arguments
            end
            it "Should load 9 currency types at the beginning" do
                currency_types = BigDoor::CurrencyType.all( @client )
                currency_types.should be_a_instance_of( Array )
                currency_types.should have(9).items
                currency_types[0].should respond_to(:title).with(0).arguments
                currency_types[0].should respond_to(:description).with(0).arguments
            end
        end
    end
end
