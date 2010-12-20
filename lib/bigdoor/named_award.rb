module BigDoor
    #
    # This module provides NamedAward Resource object 
    # corresponding to /named_award BigDoor API end point
    #
    class NamedAward < Resource
        def initialize( hash = {} ) 
            $log.debug( "NamedAward init with hash = #{hash.inspect}")
            default_values = {
                'read_only'                          => 1,
                'parent_id'                          => nil,
                'named_award_collection_id'          => nil,
                'relative_weight'                    => 0,
                'urls'                               => [],
            }
            default_values.merge!( hash )
            $log.debug( "NamedAward default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
