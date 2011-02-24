module BigDoor
    #
    # This module provides Attribute Resource object 
    # corresponding to /attribute BigDoor API end point
    #
    class Attribute < ResourceWithAssociation
        ##
        # Initialize new Attribute object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
        def initialize( hash = {} ) 
            $log.debug( "Attribute init with hash = #{hash.inspect}")
            default_values = { }
            default_values.merge!( hash )
            $log.debug( "Attribute default_values = #{default_values.inspect}")
            super( default_values )
        end
        def self.search( friendly_id, client ) 
          result = client.get( end_point , { 'format' => 'json', 'attribute_friendly_id' => friendly_id } )
          $log.debug(sprintf 'result = %s', result.inspect );
          found_objs = result.map{ |obj|
            $log.debug("obj = #{obj.inspect}")
            self.new(obj) 
          }
          $log.debug( "found_objs = #{found_objs.inspect}")
          found_objs
        end     
    end
end
