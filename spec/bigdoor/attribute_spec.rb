require 'spec_helper'

module BigDoor 
    describe Attribute do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
        end
        context "Attribute class" do
            it "Should respond to :all" do 
                BigDoor::Attribute.should respond_to(:all).with(1).arguments
            end
            it "Should load 6 attributes at the beginning" do
                currency_types = BigDoor::Attribute.all( @client )
                currency_types.should be_a_instance_of( Array )
                currency_types.should have(6).items
            end
        end
    end
end
