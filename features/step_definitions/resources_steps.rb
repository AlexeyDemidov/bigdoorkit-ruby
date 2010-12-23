
Given /^low\-level client$/ do
      @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
end

Given /^new empty "NamedAwardCollection" collection$/ do
    @collection = BigDoor::NamedAwardCollection.new
    @collection.pub_title            = 'application achievements'
    @collection.pub_description      = 'a set of achievements that the user can earn'
    @collection.end_user_title       = 'achievements'
    @collection.end_user_description = 'things you can get'
    @collection.save( @client )
end

Given /^new empty NamedGoodCollection$/ do
    @collection = BigDoor::NamedGoodCollection.new
    @collection.pub_title            = 'Test Named Good Collection'
    @collection.pub_description      = 'test description'
    @collection.end_user_title       = 'test user title'
    @collection.end_user_description = 'test user description'
    @collection.save( @client )
end

Given /^new empty NamedLevelCollection$/ do
    @collection = BigDoor::NamedLevelCollection.new({
        'pub_title'            => 'Test Named Level Collection',
        'pub_description'      => 'test description',
        'end_user_title'       => 'test user title',
        'end_user_description' => 'test user description',
        'currency_id'          =>  @currency.resource_id,
    })

    @collection.save( @client )
end

Given /^some Currency$/ do
    @currency = BigDoor::Currency.new({
        'pub_title'            => 'Coins',
        'pub_description'      => 'an example of the Purchase currency type',
        'end_user_title'       => 'Coins',
        'end_user_description' => 'can only be purchased',
        'currency_type_id'     => '1',
        'currency_type_title'  => 'Purchase',
        'exchange_rate'        => 900.00,
        'relative_weight'      => 2,
    })
    @currency.save( @client )
end

When /^I call it to list all "(\w+)" objects$/ do |class_name| 
    eval(" @list_all = BigDoor::#{class_name}.all( @client ) ")
end

When /^I create a new "(\w+)" object$/ do |class_name|
    eval(" @object = BigDoor::#{class_name}.new")
end

When /^assign some NamedAwardCollection data to object$/ do
    @object.pub_title            = 'application achievements'
    @object.pub_description      = 'a set of achievements that the user can earn'
    @object.end_user_title       = 'achievements'
    @object.end_user_description = 'things you can get'
end

When /^assign some NamedGoodCollection data to object$/ do
    @object.pub_title            = 'Test Named Good Collection title'
    @object.pub_description      = 'test named good collection description'
    @object.end_user_title       = 'test named good collection end user title'
    @object.end_user_description = 'test named good collection end user description'
end

When /^assign some NamedLevelCollection data to object$/ do
    @object.pub_title            = 'Test Named Level Collection title'
    @object.pub_description      = 'test named Level collection description'
    @object.end_user_title       = 'test named Level collection end user title'
    @object.end_user_description = 'test named Level collection end user description'
    @object.currency_id          = @currency.resource_id
end

When /^assign NamedAward data to object$/ do
    @object.pub_title                 = 'obligatory early achievement '
    @object.pub_description           = 'the sort of achievement you get when you can turn on an xbox'
    @object.end_user_title            = 'just breath'
    @object.end_user_description      = 'congratulations you rock so hard; keep on breathing'
    @object.relative_weight           = 1
    @object.named_award_collection_id = @collection.resource_id
end

When /^assign NamedGood data to object$/ do
    @object.pub_title                 = 'Named Good pub title'
    @object.pub_description           = 'Named Good pub description'
    @object.end_user_title            = 'Named Good end user title'
    @object.end_user_description      = 'Named Good end user description'
    @object.relative_weight           = 1
    @object.named_good_collection_id = @collection.resource_id
end

When /^assign NamedLevel data to object$/ do
    @object.pub_title                 = 'Named Level pub title'
    @object.pub_description           = 'Named Level pub description'
    @object.end_user_title            = 'Named Level end user title'
    @object.end_user_description      = 'Named Level end user description'
#    @object.relative_weight           = 1
#    @object.threshold                 = 100
    @object.named_level_collection_id = @collection.resource_id
end

When /^I create and save a new EndUser object with random name$/ do
    @username = (0...10).map{ ('a'..'z').to_a[rand(26)] }.join
    @object = BigDoor::EndUser.new({
        'end_user_login' => @username
    }) 
    @object.save( @client )
end


When /^save object$/ do
      @object.save( @client )
end

When /^load object$/ do
      @object.load( @client )
end

Then /^I should get list of all "(\d+)" "(\w+)" objects$/ do |number, class_name|
    @list_all.should be_a_instance_of( Array )
    @list_all.should have(number.to_i).items
    if number.to_i > 0
        @list_all[0].should be_a_instance_of( eval(sprintf "BigDoor::%s", class_name) )
    end
end

Then /^I should get a "(\w+)" object$/ do |class_name|
    @object.should be_a_instance_of( eval(sprintf "BigDoor::%s", class_name) )
end

Then /^object should has resource_id defined$/ do
    @object.should respond_to(:resource_id)
    @object.resource_id.should be
    @object.resource_id.to_s.should match(/\d+/)
end

Then /^object should has guid defined$/ do
    @object.should respond_to(:guid)
    @object.guid.should be
    @object.guid.to_s.should match(/[a-f\d]+/)
end

Then /^I should be able to remove object$/ do
    @object.should respond_to(:delete)
    @object.delete( @client )
end

Then /^collection should be removed too$/ do
    @collection.should respond_to(:delete)
    @collection.delete( @client )
end

Then /^Currency should be removed$/ do
    @currency.delete( @client )
end

Then /^I should be able to assign Profile to EndUser$/ do
    @profile = BigDoor::Profile.new({
        'provider'      => 'publisher',
        'email'         => 'end_user@example.com',
        'first_name'    => 'John',
        'last_name'     => 'Doe',
        'display_name'  => 'John Doe',
        'profile_photo' => 'http://example.com/image.jpg',
        'example_key'   => 'Example Value',
        'end_user_login' => @username,
    })
    @profile.save( @client )
end
