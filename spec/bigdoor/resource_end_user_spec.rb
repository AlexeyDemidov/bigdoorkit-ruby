require 'spec_helper'

module BigDoor 
    describe ResourceEndUser do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
        end
        context "ResourceEndUser class" do
            it "Should respond to :all" do 
                BigDoor::ResourceEndUser.should respond_to(:all).with(2).arguments
            end
            subject { BigDoor::ResourceEndUser.new( {}  )  }
            it { should be }
            it { should be_instance_of BigDoor::ResourceEndUser}
            it { should respond_to(:save).with(1).arguments}
            it { should respond_to(:load).with(1).arguments}
            it { should respond_to(:load).with(2).arguments}
            it { should respond_to(:delete).with(1).arguments}
            it { should respond_to(:delete).with(2).arguments}
        end
    end
end
