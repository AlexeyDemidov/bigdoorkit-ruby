$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'bigdoor/client'
require 'bigdoor/resource'
require 'bigdoor/resource_with_association'
require 'bigdoor/resource_with_parent'

require 'bigdoor/attribute'
require 'bigdoor/award'
require 'bigdoor/currency'  
require 'bigdoor/currency_balance'
require 'bigdoor/currency_type'
require 'bigdoor/end_user'
require 'bigdoor/good'
require 'bigdoor/leaderboard'
require 'bigdoor/level'
require 'bigdoor/named_award'
require 'bigdoor/named_award_collection'
require 'bigdoor/named_good'
require 'bigdoor/named_good_collection'
require 'bigdoor/named_level'
require 'bigdoor/named_level_collection'
require 'bigdoor/named_transaction'
require 'bigdoor/named_transaction_group'
require 'bigdoor/profile'
require 'bigdoor/url'

$log = Logger.new('log.txt')
$log.level = Logger::DEBUG
$log.datetime_format = "%Y-%m-%d %H:%M:%S "
$log.debug( '=======================')
$log.debug( $log.datetime_format)


module BigDoor
  VERSION = '0.0.1'
end
