module BigDoor
    #
    # This module provides NamedLevel Resource object 
    # corresponding to /named_level BigDoor API end point
    #
    class NamedLevel < ResourceWithParent
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

        def parent_end_point 
            'named_level_collection'
        end

        def parent_id_attr
            'named_level_collection_id'
        end
    end
end
