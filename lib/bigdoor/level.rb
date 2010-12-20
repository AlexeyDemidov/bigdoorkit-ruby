module BigDoor
    #
    # This module provides Level Resource object 
    # corresponding to /end_user/{id}/level BigDoor API end point
    #
    class Level < Resource
        def initialize( hash = {} ) 
            $log.debug( "Level init with hash = #{hash.inspect}")
            default_values = {
                'transaction_group_id' => 0,
                'read_only'            => 0,
                'end_user_login'       => nil,
                'named_level_id'       => nil,
            }
            default_values.merge!( hash )
            $log.debug( "Level default_values = #{default_values.inspect}")
            super( default_values )
        end

        def parent_end_point 
            'end_user'
        end

        def parent_id_attr
            'end_user_login'
        end
    end
end
