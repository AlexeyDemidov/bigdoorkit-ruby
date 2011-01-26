require 'spec_helper'

module BigDoor 
    describe Attribute do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "Attribute class" do
            it "Should respond to :all" do 
                BigDoor::Attribute.should respond_to(:all).with(1).arguments
            end
            it "Should load Array of Attributes at the beginning" do
                currency_types = BigDoor::Attribute.all( @client )
                currency_types.should be_a_instance_of( Array )
            end
        end
    end
end
