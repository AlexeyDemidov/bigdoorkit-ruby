require 'spec_helper'

module BigDoor 
    describe ResourceWithAssociation do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "ResourceWithAssociation class" do
            it "Should respond to :all" do 
                BigDoor::ResourceWithAssociation.should respond_to(:all).with(1).arguments
            end
            subject { BigDoor::ResourceWithAssociation.new( {}  )  }
            it { should be }
            it { should be_instance_of BigDoor::ResourceWithAssociation}
            it { should respond_to(:associate_with).with(2).arguments}
            it { should respond_to(:save).with(1).arguments}
            it { should respond_to(:load).with(1).arguments}
            it { should respond_to(:load).with(2).arguments}
            it { should respond_to(:delete).with(1).arguments}
            it { should respond_to(:delete).with(2).arguments}
        end
    end
end
