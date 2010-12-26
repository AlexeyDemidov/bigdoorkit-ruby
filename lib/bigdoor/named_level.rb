module BigDoor
    #
    # This module provides NamedLevel Resource object 
    # corresponding to /named_level BigDoor API end point
    #
    class NamedLevel < ResourceWithParent
        ##
        # Initialize new NamedLevel object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
        def initialize( hash = {} ) 
            $log.debug( "NamedLevel init with hash = #{hash.inspect}")
            default_values = {
                'named_level_collection_id'          => nil,
                'relative_weight'                    => 0,
                'threshold'                          => 0,
            }
            default_values.merge!( hash )
            $log.debug( "NamedLevel default_values = #{default_values.inspect}")
            super( default_values )
        end

    end
end
