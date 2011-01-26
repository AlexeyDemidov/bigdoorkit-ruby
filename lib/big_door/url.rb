module BigDoor
    #
    # This module provides URL Resource object 
    # corresponding to /url BigDoor API end point
    #
    class URL < ResourceWithAssociation
        ##
        # Initialize new URL object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
        def initialize( hash = {} ) 
            $log.debug( "URL init with hash = #{hash.inspect}")
            default_values = { }
            default_values.merge!( hash )
            $log.debug( "URL default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
