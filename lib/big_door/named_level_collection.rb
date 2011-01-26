module BigDoor
    #
    # This module provides NamedLevelCollection Resource object 
    # corresponding to /named_level_collection BigDoor API end point
    #
    class NamedLevelCollection < Resource
        ##
        # Initialize new NamedLevelCollection object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
        def initialize( hash = {} ) 
            $log.debug( "NamedLevelCollection init with hash = #{hash.inspect}")
            default_values = {
                'currency_id'  => nil,
            }
            default_values.merge!( hash )
            $log.debug( "NamedLevelCollection default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
