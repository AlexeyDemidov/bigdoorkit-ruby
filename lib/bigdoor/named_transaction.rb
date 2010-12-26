module BigDoor
    #
    # This module provides NamedTransaction Resource object 
    # corresponding to /named_transaction BigDoor API end point
    #
    class NamedTransaction < Resource
        ##
        # Initialize new NamedTransaction object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
        def initialize( hash = {} ) 
            $log.debug( "NamedTransaction init with hash = #{hash.inspect}")
            default_values = { }
            default_values.merge!( hash )
            $log.debug( "NamedTransaction default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
