require 'spec_helper'

module BigDoor 
    describe CurrencyType do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "CurrencyType class" do
            it "Should respond to :all" do 
                BigDoor::CurrencyType.should respond_to(:all).with(1).arguments
            end
            it "Should load Array of Currency types at the beginning" do
                currency_types = BigDoor::CurrencyType.all( @client )
                currency_types.should be_a_instance_of( Array )
                # currency_types.should have(9).items
                currency_types[0].should respond_to(:title).with(0).arguments
                currency_types[0].should respond_to(:description).with(0).arguments
            end
        end
    end
end
