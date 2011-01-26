require 'spec_helper'

module BigDoor 
    describe Leaderboard do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "fresh Leaderboard object" do 
            subject { BigDoor::Leaderboard.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::Leaderboard )}
            it { should respond_to(:execute).with(2).arguments}
        end
    end
end
