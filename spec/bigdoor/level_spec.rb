require 'spec_helper'

module BigDoor 
    describe Level do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
        end
        context "fresh Level object" do 
            subject { BigDoor::Level.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::Level )}
        end
        context "Level class" do
            it "Should respond to :all" do 
                BigDoor::Level.should respond_to(:all).with(1).arguments
            end
        end
    end
end
