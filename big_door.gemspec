# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{big_door}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex L. Demidov"]
  s.date = %q{2011-02-03}
  s.default_executable = %q{example.rb}
  s.description = %q{Client library for the BigDoor REST API (http://bigdoor.com). This package
provides both low-level procedural (BigDoor::Client) and object-oriented
(BigDoor::Resource object hierarchy) interfaces to BigDoor REST API.}
  s.email = ["alexeydemidov@gmail.com"]
  s.executables = ["example.rb"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "autotest/discover.rb", "big_door.gemspec", "bin/example.rb", "features/resources/attribute.feature", "features/resources/currency_type.feature", "features/resources/end_user.feature", "features/resources/named_award_collection.feature", "features/resources/named_good_collection.feature", "features/resources/named_level_collection.feature", "features/resources/url.feature", "features/step_definitions/resources_steps.rb", "features/support/env.rb", "lib/big_door.rb", "lib/big_door/attribute.rb", "lib/big_door/award.rb", "lib/big_door/client.rb", "lib/big_door/currency.rb", "lib/big_door/currency_balance.rb", "lib/big_door/currency_type.rb", "lib/big_door/end_user.rb", "lib/big_door/good.rb", "lib/big_door/leaderboard.rb", "lib/big_door/level.rb", "lib/big_door/named_award.rb", "lib/big_door/named_award_collection.rb", "lib/big_door/named_good.rb", "lib/big_door/named_good_collection.rb", "lib/big_door/named_level.rb", "lib/big_door/named_level_collection.rb", "lib/big_door/named_transaction.rb", "lib/big_door/named_transaction_group.rb", "lib/big_door/profile.rb", "lib/big_door/resource.rb", "lib/big_door/resource_end_user.rb", "lib/big_door/resource_with_association.rb", "lib/big_door/resource_with_parent.rb", "lib/big_door/url.rb", "script/console", "script/destroy", "script/generate", "spec/big_door/attribute_spec.rb", "spec/big_door/award_spec.rb", "spec/big_door/client_spec.rb", "spec/big_door/currency_balance_spec.rb", "spec/big_door/currency_spec.rb", "spec/big_door/currency_type_spec.rb", "spec/big_door/end_user_spec.rb", "spec/big_door/good_spec.rb", "spec/big_door/leaderboard_spec.rb", "spec/big_door/level_spec.rb", "spec/big_door/named_award_collection_spec.rb", "spec/big_door/named_award_spec.rb", "spec/big_door/named_good_collection_spec.rb", "spec/big_door/named_good_spec.rb", "spec/big_door/named_level_collection_spec.rb", "spec/big_door/named_level_spec.rb", "spec/big_door/named_transaction_group_spec.rb", "spec/big_door/named_transaction_spec.rb", "spec/big_door/profile_spec.rb", "spec/big_door/resource_end_user_spec.rb", "spec/big_door/resource_spec.rb", "spec/big_door/resource_with_association_spec.rb", "spec/big_door/resource_with_parent_spec.rb", "spec/big_door/url_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/cucumber.rake", "tasks/rspec.rake"]
  s.homepage = %q{http://bitbucket.org/AlexeyDemidov/bigdoorkit-ruby/}
  s.license = %q{restricted}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{big_door}
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{Client library for the BigDoor REST API (http://bigdoor.com)}
  s.test_files = ["spec/big_door/attribute_spec.rb", "spec/big_door/award_spec.rb", "spec/big_door/client_spec.rb", "spec/big_door/currency_balance_spec.rb", "spec/big_door/currency_spec.rb", "spec/big_door/currency_type_spec.rb", "spec/big_door/end_user_spec.rb", "spec/big_door/good_spec.rb", "spec/big_door/leaderboard_spec.rb", "spec/big_door/level_spec.rb", "spec/big_door/named_award_collection_spec.rb", "spec/big_door/named_award_spec.rb", "spec/big_door/named_good_collection_spec.rb", "spec/big_door/named_good_spec.rb", "spec/big_door/named_level_collection_spec.rb", "spec/big_door/named_level_spec.rb", "spec/big_door/named_transaction_group_spec.rb", "spec/big_door/named_transaction_spec.rb", "spec/big_door/profile_spec.rb", "spec/big_door/resource_end_user_spec.rb", "spec/big_door/resource_spec.rb", "spec/big_door/resource_with_association_spec.rb", "spec/big_door/resource_with_parent_spec.rb", "spec/big_door/url_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>, ["~> 1.0"])
      s.add_runtime_dependency(%q<addressable>, ["~> 2.0"])
      s.add_runtime_dependency(%q<json>, ["~> 1.0"])
      s.add_runtime_dependency(%q<uuidtools>, ["~> 2.0"])
      s.add_development_dependency(%q<cucumber>, ["~> 0.10"])
      s.add_development_dependency(%q<rspec>, ["~> 2.4"])
      s.add_development_dependency(%q<hoe>, [">= 2.8.0"])
    else
      s.add_dependency(%q<rest-client>, ["~> 1.0"])
      s.add_dependency(%q<addressable>, ["~> 2.0"])
      s.add_dependency(%q<json>, ["~> 1.0"])
      s.add_dependency(%q<uuidtools>, ["~> 2.0"])
      s.add_dependency(%q<cucumber>, ["~> 0.10"])
      s.add_dependency(%q<rspec>, ["~> 2.4"])
      s.add_dependency(%q<hoe>, [">= 2.8.0"])
    end
  else
    s.add_dependency(%q<rest-client>, ["~> 1.0"])
    s.add_dependency(%q<addressable>, ["~> 2.0"])
    s.add_dependency(%q<json>, ["~> 1.0"])
    s.add_dependency(%q<uuidtools>, ["~> 2.0"])
    s.add_dependency(%q<cucumber>, ["~> 0.10"])
    s.add_dependency(%q<rspec>, ["~> 2.4"])
    s.add_dependency(%q<hoe>, [">= 2.8.0"])
  end
end
