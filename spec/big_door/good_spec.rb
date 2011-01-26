require 'spec_helper'

module BigDoor 
    describe Good do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "fresh Good object" do 
            subject { BigDoor::Good.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::Good )}
        end
    end
end
