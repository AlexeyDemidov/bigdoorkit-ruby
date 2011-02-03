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
            it "Should load array of named transaction groups at the beginning" do
                currency_types = BigDoor::NamedTransactionGroup.all( @client )
                currency_types.should be_a_instance_of( Array )
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
            it "Should return Array on associate_with" do
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
                ntg = BigDoor::NamedTransactionGroup.new({ 
                    'pub_title'             => 'Test Transaction Group',
                    'pub_description'       => 'test description',
                    'end_user_title'        => 'end user title',
                    'end_user_description'  => 'end user description',
                    'end_user_cap'          => '-1',
                    'end_user_cap_interval' => '-1',
                })
                ntg.save( @client )

                nt = BigDoor::NamedTransaction.new({
                    'pub_title'            => 'Test Transaction',
                    'pub_description'      => 'test description',
                    'end_user_title'       => 'end user title',
                    'end_user_description' => 'end user description',
                    'currency_id'          => currency.resource_id,
                    'amount'               => '50',
                    'default_amount'       => '50',
                })
                nt.save( @client )

                result = ntg.associate_with( nt, @client, 1 )
                result.should be_a_instance_of( Hash )
                result['resource_name'].should  == 'transaction_group_to_transaction'

                ntg.delete( @client )
                nt.delete( @client )
                currency.delete( @client )
            end
            it "Should return Array on execute" do
                username = (0...10).map{ ('a'..'z').to_a[rand(26)] }.join
                end_user = BigDoor::EndUser.new({
                    'end_user_login' => username
                }) 
                end_user.save( @client )
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
                ntg = BigDoor::NamedTransactionGroup.new({ 
                    'pub_title'             => 'Test Transaction Group',
                    'pub_description'       => 'test description',
                    'end_user_title'        => 'end user title',
                    'end_user_description'  => 'end user description',
                    'end_user_cap'          => '-1',
                    'end_user_cap_interval' => '-1',
                })
                ntg.save( @client )

                nt = BigDoor::NamedTransaction.new({
                    'pub_title'            => 'Test Transaction',
                    'pub_description'      => 'test description',
                    'end_user_title'       => 'end user title',
                    'end_user_description' => 'end user description',
                    'currency_id'          => currency.resource_id,
                    'amount'               => '50',
                    'default_amount'       => '50',
                })
                nt.save( @client )
                ntg.associate_with( nt, @client, 1 )
                result = ntg.execute( username, { 'good_receiver' => username , 'verbosity' => '9', 'allow_negative_balance' => 'true'}, @client )
                result.should be_a_instance_of( Hash )
                result['transaction_group_id'].should be
                ntg.delete( @client )
                nt.delete( @client )
                currency.delete( @client )
                end_user.delete( @client )
            end
        end
    end
end
