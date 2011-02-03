require 'spec_helper'

module BigDoor 
    describe Leaderboard do
        before(:each) do
            @client = BigDoor::Client.new( TEST_APP_SECRET, TEST_APP_KEY )
        end
        context "fresh Leaderboard object" do 
            subject { BigDoor::Leaderboard.new  }
            it { should be }
            it { should be_a_instance_of( BigDoor::Leaderboard )}
            it { should respond_to(:execute).with(2).arguments}
            it "Should return Array on execute" do
                currency = BigDoor::Currency.new({
                    'pub_title'            => 'Coins',
                    'pub_description'      => 'an example of the Purchase currency type',
                    'end_user_title'       => 'Coins',
                    'end_user_description' => 'can only be purchased',
                    'currency_type_id'     => 1,
                    'currency_type_title'  => 'Purchase',
                    'exchange_rate'        => 900,
                    'relative_weight'      => 2,
                })
                currency.save( @client )
                result = subject.execute( { 'format' => 'json', 'verbosity' => '9', 'type' => 'currency', 'filter_value' => currency.resource_id }, @client )
                result['results'].should be_a_instance_of( Array )
                currency.delete( @client )
            end
        end
    end
end
