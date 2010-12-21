require 'spec_helper'

module BigDoor 
    describe Profile do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
        end
        context "fresh Profile object" do 
            subject { BigDoor::Profile.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::Profile )}
        end
        context "Profile class" do
            it "Should respond to :all" do 
                BigDoor::Profile.should respond_to(:all).with(1).arguments
            end
        end
    end
end
