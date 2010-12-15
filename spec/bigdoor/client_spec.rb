require 'spec_helper'

FAKE_APP_KEY    = '28d3da80bf36fad415ab57b3130c6cb6'
FAKE_APP_SECRET = 'B66F956ED83AE218612CB0FBAC2EF01C'
TEST_APP_KEY    = ENV['BIGDOOR_API_KEY']    || FAKE_APP_KEY
TEST_APP_SECRET = ENV['BIGDOOR_API_SECRET'] || FAKE_APP_SECRET

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
                it { should respond_to(:get).with(2).arguments }
                it { should respond_to(:get).with(1).arguments }
                it "should return 9 predefined currency_type objects" do
                    response = subject.get('/currency_type')
                    response.should be
                    response.should be_a_instance_of( Array )
                    response.length.should == 9
                end
            end

            describe "#post" do
                it { should respond_to(:post).with(3).arguments }
            end
            describe "#put" do
                it { should respond_to(:put).with(3).arguments }
            end
            describe "#delete" do
                it { should respond_to(:delete).with(2).arguments }
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
