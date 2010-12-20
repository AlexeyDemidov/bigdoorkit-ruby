module BigDoor
    #
    # This module provides Profile Resource object 
    # corresponding to /end_user/{id}/profile BigDoor API end point
    #
    class Profile < Resource
        def initialize( hash = {} ) 
            $log.debug( "Profile init with hash = #{hash.inspect}")
            default_values = {
                'provider'       => '',
                'email'          => '',
                'first_name'     => '', 
                'last_name'      => '',
                'display_name'   => '',
                'profile_photo'  => '',
            }
            default_values.merge!( hash )
            $log.debug( "Profile default_values = #{default_values.inspect}")
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
