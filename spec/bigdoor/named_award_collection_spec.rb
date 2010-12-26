require 'spec_helper'

module BigDoor 
    describe NamedAwardCollection do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "NamedAwardCollection class" do
            it "Should respond to :all" do 
                BigDoor::NamedAwardCollection.should respond_to(:all).with(1).arguments
            end
            it "Should load 0 named award collections at the beginning" do
                currency_types = BigDoor::NamedAwardCollection.all( @client )
                currency_types.should be_a_instance_of( Array )
                currency_types.should be_empty
            end
        end
        context "fresh NamedAwardCollection object" do 
            subject { BigDoor::NamedAwardCollection.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::NamedAwardCollection )}
        end
    end
end
