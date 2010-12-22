require 'spec_helper'

module BigDoor 
    describe URL do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
        end
        context "URL class" do
            it "Should respond to :all" do 
                BigDoor::URL.should respond_to(:all).with(1).arguments
            end
            it "Should load 0 URLs at the beginning" do
                currency_types = BigDoor::URL.all( @client )
                currency_types.should be_a_instance_of( Array )
                currency_types.should be_empty
            end
        end
        context "fresh URL object" do 
            subject { BigDoor::URL.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::URL )}
        end
    end
end
