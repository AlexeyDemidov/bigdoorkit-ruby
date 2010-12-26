module BigDoor
    #
    # This module provides NamedAwardCollection Resource object 
    # corresponding to /named_award_collection BigDoor API end point
    #
    class NamedAwardCollection < Resource
        ##
        # Initialize new NamedAwardCollection object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
        def initialize( hash = {} ) 
            $log.debug( "NamedAwardCollection init with hash = #{hash.inspect}")
            default_values = { }
            default_values.merge!( hash )
            $log.debug( "NamedAwardCollection default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
