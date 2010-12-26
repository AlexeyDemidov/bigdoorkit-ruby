require 'spec_helper'

module BigDoor 
    describe Currency do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "Currency class" do
            it "Should respond to :all" do 
                BigDoor::Currency.should respond_to(:all).with(1).arguments
            end
            it "Should load 0 currencies at the beginning" do
                currencies = BigDoor::Currency.all( @client )
                currencies.should be_a_instance_of( Array )
                currencies.should be_empty
            end
        end
        context "fresh Currency object" do 
            subject { BigDoor::Currency.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::Currency )}
            it { should respond_to(:save).with(1).arguments }
            it "Should save object successfully" do

                subject.pub_title = 'Coins'
                subject.pub_description = 'an example of the Purchase currency type'
                subject.end_user_title = 'Coins'
                subject.end_user_description = 'can only be purchased'
                subject.currency_type_id = 1
                subject.currency_type_title = 'Purchase'
                subject.exchange_rate = 900
                subject.relative_weight = 2

                subject.save( @client )

                should respond_to('resource_id').with(0).arguments
                subject.resource_id.to_s.should =~ /\d+/
                save_resource_id = subject.resource_id

                should respond_to('resource_name').with(0).arguments
                subject.resource_name.should == 'currency'

                subject.pub_title = 'Banknotes'
                subject.save( @client )
                subject.resource_id.should == save_resource_id
                subject.pub_title.should == 'Banknotes'

                subject.resource_id = nil
                subject.pub_title = nil

                should respond_to('load').with(2).arguments
                subject.load( @client, save_resource_id  )
                
                subject.resource_id.should == save_resource_id
                subject.pub_title.should == 'Banknotes'

                subject.pub_title = nil

                should respond_to('load').with(1).arguments
                subject.load( @client )
                
                subject.resource_id.should == save_resource_id
                subject.pub_title.should == 'Banknotes'
                
                currencies = BigDoor::Currency.all( @client )
                currencies.should be_a_instance_of( Array )
                currencies.should_not be_empty

                currencies[0].should be_a_instance_of( Currency )
                currencies[0].resource_id.to_s.should == save_resource_id

                should respond_to(:delete).with(1).arguments
                subject.delete( @client )
            end
            it { should respond_to(:load).with(2).arguments }
            it { should respond_to(:delete).with(2).arguments }
            it "Should load 0 currencies at the end" do
                currencies = BigDoor::Currency.all( @client )
                currencies.should be_a_instance_of( Array )
                currencies.should be_empty
            end
        end
    end
end
