module BigDoor
    #
    # This module provides Good Resource object 
    # corresponding to /end_user/{id}/good BigDoor API end point
    #
    class Good < ResourceEndUser
        def initialize( hash = {} ) 
            $log.debug( "Good init with hash = #{hash.inspect}")
            default_values = {
                'end_user_login'  => nil,
                'named_good_id' => nil,
            }
            default_values.merge!( hash )
            $log.debug( "Good default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
