$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'bigdoor/client'  
require 'bigdoor/resource'  
require 'bigdoor/currency'  

$log = Logger.new('log.txt')
$log.level = Logger::DEBUG
$log.datetime_format = "%Y-%m-%d %H:%M:%S "
$log.debug( '=======================')
$log.debug( $log.datetime_format)


module BigDoor
  VERSION = '0.0.1'
end
