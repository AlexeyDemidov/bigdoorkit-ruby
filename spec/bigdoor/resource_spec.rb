require 'spec_helper'

module BigDoor 
    describe Resource do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
        end
        context "Resource class" do
            it "Should respond to :all" do 
                BigDoor::Resource.should respond_to(:all).with(1).arguments
            end
            subject { BigDoor::Resource.new( {}  )  }
            it { should be }
            it { should be_instance_of BigDoor::Resource}
            it { should respond_to(:save).with(1).arguments}
            it { should respond_to(:load).with(1).arguments}
            it { should respond_to(:load).with(2).arguments}
            it { should respond_to(:delete).with(1).arguments}
            it { should respond_to(:delete).with(2).arguments}
        end
    end
end
