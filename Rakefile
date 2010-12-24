require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require 'metric_fu'
require './lib/bigdoor'

Hoe.plugin :newgem
# Hoe.plugin :website
#Hoe.plugin :cucumberfeatures

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'bigdoorkit' do
  self.developer 'Alex L. Demidov', 'alexeydemidov@gmail.com'
#  self.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
  self.rubyforge_name       = self.name # TODO this is default value
  extra_deps     << ['rest-client', '>= 1.0.1']
  extra_deps     << ['addressable', '>= 2.0.0']
  extra_deps     << ['json', '>= 1.0.0']
  extra_deps     << ['uuidtools', '>= 2.0.0']
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# remove_task :default
# task :default => [:spec, :features]
