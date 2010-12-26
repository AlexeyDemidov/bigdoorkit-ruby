require 'spec_helper'

module BigDoor 
    describe NamedTransactionGroup do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "NamedTransactionGroup class" do
            it "Should respond to :all" do 
                BigDoor::NamedTransactionGroup.should respond_to(:all).with(1).arguments
            end
            it "Should load 0 named transaction groups at the beginning" do
                currency_types = BigDoor::NamedTransactionGroup.all( @client )
                currency_types.should be_a_instance_of( Array )
                currency_types.should be_empty
            end
            subject { BigDoor::NamedTransactionGroup.new( {}  )  }
            it { should be }
            it { should be_instance_of BigDoor::NamedTransactionGroup}
            it { should respond_to(:save).with(1).arguments}
            it { should respond_to(:load).with(1).arguments}
            it { should respond_to(:load).with(2).arguments}
            it { should respond_to(:delete).with(1).arguments}
            it { should respond_to(:delete).with(2).arguments}
            it { should respond_to(:execute).with(3).arguments}
            it { should respond_to(:associate_with).with(2).arguments}
            it { should respond_to(:associate_with).with(3).arguments}
        end
    end
end
