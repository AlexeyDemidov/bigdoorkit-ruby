require 'spec_helper'

module BigDoor 
    describe NamedAward do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "NamedAward class" do
            it "Should respond to :all" do 
                BigDoor::NamedAward.should respond_to(:all).with(1).arguments
            end
            it "Should load 0 named awards at the beginning" do
                currency_types = BigDoor::NamedAward.all( @client )
                currency_types.should be_a_instance_of( Array )
                currency_types.should be_empty
            end
        end
        context "fresh NamedAward object" do 
            subject { BigDoor::NamedAward.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::NamedAward )}
        end
    end
end
