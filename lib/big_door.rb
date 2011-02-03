$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'big_door/client'
require 'big_door/resource'
require 'big_door/resource_with_association'
require 'big_door/resource_with_parent'
require 'big_door/resource_end_user'

require 'big_door/attribute'
require 'big_door/award'
require 'big_door/currency'  
require 'big_door/currency_balance'
require 'big_door/currency_type'
require 'big_door/end_user'
require 'big_door/good'
require 'big_door/leaderboard'
require 'big_door/level'
require 'big_door/named_award'
require 'big_door/named_award_collection'
require 'big_door/named_good'
require 'big_door/named_good_collection'
require 'big_door/named_level'
require 'big_door/named_level_collection'
require 'big_door/named_transaction'
require 'big_door/named_transaction_group'
require 'big_door/profile'
require 'big_door/url'

$log =  ENV['BIGDOOR_DEBUG'] ? Logger.new('debug.log') : Logger.new( STDERR )
$log.level = ENV['BIGDOOR_DEBUG'] ? Logger::DEBUG : Logger::ERROR

$log.datetime_format = "%Y-%m-%d %H:%M:%S "
$log.debug( '=======================')
$log.debug( $log.datetime_format)


module BigDoor
  VERSION = '0.0.2'
end
