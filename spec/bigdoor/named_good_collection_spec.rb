require 'spec_helper'

module BigDoor 
    describe NamedGoodCollection do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "NamedGoodCollection class" do
            it "Should respond to :all" do 
                BigDoor::NamedGoodCollection.should respond_to(:all).with(1).arguments
            end
            it "Should load 0 named good collections at the beginning" do
                currency_types = BigDoor::NamedGoodCollection.all( @client )
                currency_types.should be_a_instance_of( Array )
                currency_types.should be_empty
            end
        end
        context "fresh NamedGoodCollection object" do 
            subject { BigDoor::NamedGoodCollection.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::NamedGoodCollection )}
        end
    end
end
