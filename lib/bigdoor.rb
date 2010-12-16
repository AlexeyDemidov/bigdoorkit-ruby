$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'bigdoor/client'  
require 'bigdoor/resource'  
require 'bigdoor/currency'  

module BigDoor
  VERSION = '0.0.1'
end
