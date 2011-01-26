module BigDoor
    #
    # This module provides NamedAward Resource object 
    # corresponding to /named_award BigDoor API end point
    #
    class NamedAward < ResourceWithParent
        ##
        # Initialize new NamedAward object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
        def initialize( hash = {} ) 
            $log.debug( "NamedAward init with hash = #{hash.inspect}")
            default_values = {
                'named_award_collection_id'          => nil,
                'relative_weight'                    => 0,
            }
            default_values.merge!( hash )
            $log.debug( "NamedAward default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
