
Given /^low\-level client$/ do
      @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
end

Given /^new empty NamedAwardCollection$/ do
    @collection = BigDoor::NamedAwardCollection.new
    @collection.pub_title            = 'application achievements'
    @collection.pub_description      = 'a set of achievements that the user can earn'
    @collection.end_user_title       = 'achievements'
    @collection.end_user_description = 'things you can get'
    @collection.save( @client )
end

When /^I call it to list all (\w+) objects$/ do |class_name| 
    eval(" @list_all = BigDoor::#{class_name}.all( @client ) ")
end

When /^I create a new (\w+)$/ do |class_name|
    eval(" @object = BigDoor::#{class_name}.new")
end

When /^set some data on it$/ do
    @object.pub_title            = 'application achievements'
    @object.pub_description      = 'a set of achievements that the user can earn'
    @object.end_user_title       = 'achievements'
    @object.end_user_description = 'things you can get'
end

When /^set NamedAward data on it$/ do
    @object.pub_title                 = 'obligatory early achievement '
    @object.pub_description           = 'the sort of achievement you get when you can turn on an xbox'
    @object.end_user_title            = 'just breath'
    @object.end_user_description      = 'congratulations you rock so hard; keep on breathing'
    @object.relative_weight           = 1
    @object.named_award_collection_id = @collection.resource_id
end

When /^save it$/ do
      @object.save( @client )
end

Then /^I should get list of all \[(\d+)\] (\w+) objects$/ do |number, class_name|
    @list_all.should be_a_instance_of( Array )
    @list_all.should have(number.to_i).items
    if number.to_i > 0
        @list_all[0].should be_a_instance_of( eval(sprintf "BigDoor::%s", class_name) )
    end
end

Then /^I should get a (\w+) object$/ do |class_name|
    @object.should be_a_instance_of( eval(sprintf "BigDoor::%s", class_name) )
end

Then /^it should has resource_id defined$/ do
    @object.should respond_to(:resource_id)
    @object.resource_id.should be
    @object.resource_id.to_s.should match(/\d+/)
end

Then /^I should be able to remove it$/ do
    @object.should respond_to(:delete)
    @object.delete( @client )
end


Then /^NamedAwardCollection should be removed too$/ do
    @collection.should respond_to(:delete)
    @collection.delete( @client )
end
