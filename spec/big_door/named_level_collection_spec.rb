require 'spec_helper'

module BigDoor 
    describe NamedLevelCollection do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "NamedLevelCollection class" do
            it "Should respond to :all" do 
                BigDoor::NamedLevelCollection.should respond_to(:all).with(1).arguments
            end
            it "Should load Array of named level collections at the beginning" do
                currency_types = BigDoor::NamedLevelCollection.all( @client )
                currency_types.should be_a_instance_of( Array )
            end
        end
        context "fresh NamedLevelCollection object" do 
            subject { BigDoor::NamedLevelCollection.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::NamedLevelCollection )}
        end
    end
end
