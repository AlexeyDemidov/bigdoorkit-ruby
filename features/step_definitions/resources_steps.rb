
Given /^low\-level client$/ do
      @client = BigDoor::Client.new( TEST_APP_KEY, TEST_APP_SECRET )
end

When /^I call it to list all (\w+) objects$/ do |class_name| 
    eval(" @list_all = BigDoor::#{class_name}.all( @client ) ")
end

Then /^I should get list of all \[(\d+)\] (\w+) objects$/ do |number, class_name|
    @list_all.should be_a_instance_of( Array )
    @list_all.should have(number.to_i).items
    if number.to_i > 0
        @list_all[0].should be_a_instance_of( eval(sprintf "BigDoor::%s", class_name) )
    end
end
