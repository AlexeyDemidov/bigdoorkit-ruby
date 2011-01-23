require 'spec_helper'

module BigDoor 
    describe NamedTransaction do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "NamedTransaction class" do
            it "Should respond to :all" do 
                BigDoor::NamedTransaction.should respond_to(:all).with(1).arguments
            end
            it "Should load Array of named transactions at the beginning" do
                currency_types = BigDoor::NamedTransaction.all( @client )
                currency_types.should be_a_instance_of( Array )
            end
        end
        context "fresh NamedTransaction object" do 
            subject { BigDoor::NamedTransaction.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::NamedTransaction )}
        end
    end
end
