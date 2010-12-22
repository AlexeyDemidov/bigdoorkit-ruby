require 'spec_helper'

module BigDoor 
    describe EndUser do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
        end
        context "EndUser class" do
            it "Should respond to :all" do 
                BigDoor::EndUser.should respond_to(:all).with(1).arguments
            end
            it "Should load 0 end_users at the beginning" do
                currency_types = BigDoor::EndUser.all( @client )
                currency_types.should be_a_instance_of( Array )
                currency_types.should be_empty
            end
        end
        context "fresh EndUser object" do 
            subject { BigDoor::EndUser.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::EndUser )}
        end
    end
end
