module BigDoor
    #
    # This module provides NamedGood Resource object 
    # corresponding to /named_good BigDoor API end point
    #
    class NamedGood < ResourceWithParent
        def initialize( hash = {} ) 
            $log.debug( "NamedGood init with hash = #{hash.inspect}")
            default_values = {
                'named_good_collection_id'           => nil,
                'relative_weight'                    => 0,
            }
            default_values.merge!( hash )
            $log.debug( "NamedGood default_values = #{default_values.inspect}")
            super( default_values )
        end

        def parent_end_point 
            'named_good_collection'
        end

        def parent_id_attr
            'named_good_collection_id'
        end
    end
end
