module BigDoor
    #
    # This module provides Good Resource object 
    # corresponding to /end_user/{id}/good BigDoor API end point
    #
    class Good < Resource
        def initialize( hash = {} ) 
            $log.debug( "Good init with hash = #{hash.inspect}")
            default_values = {
                'read_only'       => 0,
                'end_user_login'  => nil,
                'named_good_id' => nil,
            }
            default_values.merge!( hash )
            $log.debug( "Good default_values = #{default_values.inspect}")
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
