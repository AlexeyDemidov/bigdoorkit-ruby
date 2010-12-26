require 'spec_helper'

module BigDoor 
    describe Award do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "fresh Award object" do 
            subject { BigDoor::Award.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::Award )}
        end
        context "Award class" do
            it "Should respond to :all" do 
                BigDoor::Award.should respond_to(:all).with(2).arguments
            end
        end
    end
end
