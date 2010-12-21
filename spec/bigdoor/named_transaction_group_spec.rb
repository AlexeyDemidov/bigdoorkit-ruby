require 'spec_helper'

module BigDoor 
    describe NamedTransactionGroup do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
        end
        context "NamedTransactionGroup class" do
            it "Should respond to :all" do 
                BigDoor::NamedTransactionGroup.should respond_to(:all).with(1).arguments
            end
            it "Should load 0 named transaction groups at the beginning" do
                currency_types = BigDoor::NamedTransactionGroup.all( @client )
                currency_types.should be_a_instance_of( Array )
                currency_types.should be_empty
            end
        end
    end
end
