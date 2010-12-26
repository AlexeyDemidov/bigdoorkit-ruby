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
    end
end
