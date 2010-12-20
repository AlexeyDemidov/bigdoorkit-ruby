module BigDoor
    #
    # This module provides NamedGood Resource object 
    # corresponding to /named_good BigDoor API end point
    #
    class NamedGood < Resource
        def initialize( hash = {} ) 
            $log.debug( "NamedGood init with hash = #{hash.inspect}")
            default_values = {
                'read_only'                          => 1,
                'parent_id'                          => nil,
                'named_good_collection_id'           => nil,
                'relative_weight'                    => 0,
                'urls'                               => [],
                'attributes'                         => [],
                'collection_uri'                     => '',
            }
            default_values.merge!( hash )
            $log.debug( "NamedGood default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
