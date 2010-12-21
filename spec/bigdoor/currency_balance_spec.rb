require 'spec_helper'

module BigDoor 
    describe CurrencyBalance do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
        end
        context "fresh CurrencyBalance object" do 
            subject { BigDoor::CurrencyBalance.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::CurrencyBalance )}
        end
    end
end
