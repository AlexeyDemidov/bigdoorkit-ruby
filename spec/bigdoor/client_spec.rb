require 'spec_helper'

module BigDoor 
    describe Client do
        context "fresh client object" do 
            subject { BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )  }
            it { should be }
            it { should be_a_instance_of( BigDoor::Client )}
            it { should respond_to(:app_key).with(0).arguments }
            it "Should return app_key assigned" do
                subject.app_key.should == TEST_APP_KEY
            end
            
            it { should respond_to(:app_secret).with(0).arguments }
            it "Should return app_secret assigned" do
                subject.app_secret.should == TEST_APP_SECRET
            end

            it { should respond_to(:app_host).with(0).arguments }
            it "Should return default app_host" do
                subject.app_host.should == 'http://api.bigdoor.com'
            end
            
            describe "#get" do 
                it { should respond_to(:get).with(1).arguments }
                it { should respond_to(:get).with(2).arguments }
                it "should return 9 predefined currency_type objects" do
                    response = subject.get('currency_type')
                    response.should be
                    response.should be_a_instance_of( Array )
                    response.length.should == 9
                end
            end

            describe "#post" do
                it { should respond_to(:post).with(3).arguments }
                it "should create currency object" do
                    currency = {
                        'pub_title'            => 'Coins ',
                        'pub_description'      => 'an example of the Purchase currency type',
                        'end_user_title'       => 'Coins',
                        'end_user_description' => 'can only be purchased',
                        'currency_type_id'     => '1',
                        'currency_type_title'  => 'Purchase',
                        'exchange_rate'        => 900.00,
                        'relative_weight'      => 2,
                    }
                    response = subject.post('currency', { 'format' => 'json' }, currency )
                    response.should be
                    response.should be_a_instance_of( Hash )
                    response['pub_title'].should == 'Coins '
                    response['pub_description'].should == 'an example of the Purchase currency type'
                    response['id'].should be
                    currency_id = response['id'].to_s
                    currency_id.should =~ /[0-9]+/

                    subject.delete('currency/%s' % currency_id )
                end
            end
            describe "#put" do
                it { should respond_to(:put).with(3).arguments }
                it "should create and update currency object" do
                    currency = {
                        'pub_title'            => 'Coins ',
                        'pub_description'      => 'an example of the Purchase currency type',
                        'end_user_title'       => 'Coins',
                        'end_user_description' => 'can only be purchased',
                        'currency_type_id'     => '1',
                        'currency_type_title'  => 'Purchase',
                        'exchange_rate'        => 900.00,
                        'relative_weight'      => 2,
                    }
                    response = subject.post('currency', { 'format' => 'json' }, currency )
                    response.should be
                    response.should be_a_instance_of( Hash )
                    response['id'].should be
                    currency_id = response['id'].to_s
                    currency_id.should =~ /[0-9]+/

                    currency['pub_title'] = 'Coins'
                    currency.delete('token')
                    response = subject.put('currency/%s' % currency_id, { 'format' => 'json' }, currency )
                    response.should be
                    response.should be_a_instance_of( Hash )
                    response['pub_title'].should == 'Coins'
                    response['pub_description'].should == 'an example of the Purchase currency type'
                    subject.delete('currency/%s' % currency_id )
                end
            end
            describe "#delete" do
                it { should respond_to(:delete).with(2).arguments }
                it "should create and delete currency object" do
                    currency = {
                        'pub_title'            => 'Coins ',
                        'pub_description'      => 'an example of the Purchase currency type',
                        'end_user_title'       => 'Coins',
                        'end_user_description' => 'can only be purchased',
                        'currency_type_id'     => '1',
                        'currency_type_title'  => 'Purchase',
                        'exchange_rate'        => 900.00,
                        'relative_weight'      => 2,
                    }
                    response = subject.post('currency', { 'format' => 'json' }, currency )
                    response.should be
                    response.should be_a_instance_of( Hash )
                    response['id'].should be
                    currency_id = response['id'].to_s
                    currency_id.should =~ /[0-9]+/

                
                    # FIXME check for exception    
                    response = subject.delete('currency/%s' % currency_id )
                    # check that zero objects left
                end
            end

        end
        describe "fresh client object with app_host set explictly" do
            subject { BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET, 'http://localhost/') }
            it "Should return app_host assigned" do
                    subject.app_host.should == 'http://localhost/'
            end
        end    

        context "fresh client object with fake keys" do
            subject { BigDoor::Client.new( FAKE_APP_KEY , FAKE_APP_SECRET ) }
            it { should respond_to(:generate_signature).with(2).arguments }
            it "Should generate matching signature for 2 arguments" do
                params = { 'time' => 1270503018.33  }
                url = "/api/publisher/#{FAKE_APP_KEY}/transaction_summary"
                signature = subject.generate_signature( url, params )
                signature.should == '9d1550bb516ee2cc47d163b4b99f00e15c84b3cd32a82df9fd808aa0eb505f04'
            end
            it { should respond_to(:generate_signature).with(1).arguments }
            it "Should generate matching signature for 1 argument" do
                url = "/api/publisher/#{FAKE_APP_KEY}/transaction_summary"
                signature = subject.generate_signature( url ) 
                signature.should == 'fa5ae4f36a4d90abae0cbbe5fd3d59b73bae6638ff517e9c26be64569c696bcc'
            end
            it { should respond_to(:generate_signature).with(2).arguments }
            it "Should generate matching signature for 2 argument and whitelisted param" do
                url = "/api/publisher/#{FAKE_APP_KEY}/transaction_summary"
                params = { 'format' => 'json', 'sig' => 'this_sig_is_fake!' }
                signature = subject.generate_signature( url, params ) 
                signature.should == 'fa5ae4f36a4d90abae0cbbe5fd3d59b73bae6638ff517e9c26be64569c696bcc'
            end
            it { should respond_to(:generate_signature).with(3).arguments }
            it "Should generate matching signature for 3 argument and whitelisted param" do

                url = "/api/publisher/#{FAKE_APP_KEY}/currency/1"

                params = { 'format' => 'json', 'time' => '1270517162.52'};
                payload = { 
                    'end_user_description' => 'Testing signature generation.',
                    'time'                 => '1270517162.52',
                    'token'                => 'bd323c0ca7c64277ba2b0cd9f93fe463' 
                }
                signature = subject.generate_signature( url, params, payload ) 
                signature.should == 'cd073723c4901b57466694f63a2b7746caf1836c9bcdd4f98d55357334c2de64'
            end
        end
    end
end
