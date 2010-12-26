module BigDoor
    #
    # This module provides NamedGoodCollection Resource object 
    # corresponding to /named_good_collection BigDoor API end point
    #
    class NamedGoodCollection < Resource
        ##
        # Initialize new NamedGoodCollection object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
        def initialize( hash = {} ) 
            $log.debug( "NamedGoodCollection init with hash = #{hash.inspect}")
            default_values = {
            }
            default_values.merge!( hash )
            $log.debug( "NamedGoodCollection default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
