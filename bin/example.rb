#!/usr/bin/env ruby


require 'rubygems'
require 'big_door'
require './lib/big_door.rb'

# see API Keys http://publisher.bigdoor.com/
APP_KEY    = ENV['BIGDOOR_API_KEY']    
APP_SECRET = ENV['BIGDOOR_API_SECRET'] 

client = BigDoor::Client.new( APP_SECRET, APP_KEY )
currency = BigDoor::Currency.new({
    'pub_title'            => 'Coins',
    'pub_description'      => 'an example of the Purchase currency type',
    'end_user_title'       => 'Coins',
    'end_user_description' => 'can only be purchased',
    'currency_type_id'     => '1',
    'currency_type_title'  => 'Purchase',
    'exchange_rate'        => 900.00,
    'relative_weight'      => 2,
})

currency.save( client )

currency.load( client ) # reload object

currency.pub_title = 'Bank Notes'
currency.save( client ) # updates object keeping same ID

currency_id = currency.resource_id
currency.load( client, currency_id) # load object by explictly defined id

nlc = BigDoor::NamedLevelCollection.new({
    'pub_title'            => 'Test Named Level Collection',
    'pub_description'      => 'test description',
    'end_user_title'       => 'test user title',
    'end_user_description' => 'test user description',
    'currency_id'          =>  currency.resource_id,
})

nlc.save( client )

nl = BigDoor::NamedLevel.new({
    'pub_title'                 => 'Named Level pub title',
    'pub_description'           => 'Named Level pub description',
    'end_user_title'            => 'Named Level end user title',
    'end_user_description'      => 'Named Level end user description',
    'relative_weight'           => 1,
    'threshold'                 => 10,
    'named_level_collection_id' => nlc.resource_id,
})
nl.save( client )

ntg = BigDoor::NamedTransactionGroup.new({
    'pub_title'             => 'Test Transaction Group',
    'pub_description'       => 'test description',
    'end_user_title'        => 'end user title',
    'end_user_description'  => 'end user description',
    'end_user_cap'          => '-1',
    'end_user_cap_interval' => '-1',
})
ntg.save( client )

nt = BigDoor::NamedTransaction.new({
    'pub_title'            => 'Test Transaction',
    'pub_description'      => 'test description',
    'end_user_title'       => 'end user title',
    'end_user_description' => 'end user description',
    'currency_id'          => currency.resource_id,
    'amount'               => '50',
    'default_amount'       => '50',
})
nt.save( client )

ntg.associate_with( nt, client, 1 )

username = (0...10).map{ ('a'..'z').to_a[rand(26)] }.join

end_user = BigDoor::EndUser.new({
    'end_user_login' => username
})
end_user.save( client )

ntg.execute( username, { 'good_receiver' => username }, client )

# cleanup
currency.delete( client )
ntg.delete( client )
nt.delete( client )
nl.delete( client )
nlc.delete( client )
end_user.delete( client )
