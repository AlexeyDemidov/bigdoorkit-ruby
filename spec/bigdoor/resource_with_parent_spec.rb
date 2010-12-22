require 'spec_helper'

module BigDoor 
    describe ResourceWithParent do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
        end
        context "ResourceWithParent class" do
            it "Should respond to :all" do 
                BigDoor::ResourceWithParent.should respond_to(:all).with(1).arguments
            end
            subject { BigDoor::ResourceWithParent.new( {}  )  }
            it { should be }
            it { should be_instance_of BigDoor::ResourceWithParent}
            it { should respond_to(:save).with(1).arguments}
            it { should respond_to(:load).with(1).arguments}
            it { should respond_to(:load).with(2).arguments}
            it { should respond_to(:delete).with(1).arguments}
            it { should respond_to(:delete).with(2).arguments}
        end
    end
end
