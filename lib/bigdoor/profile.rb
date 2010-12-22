module BigDoor
    #
    # This module provides Profile Resource object 
    # corresponding to /end_user/{id}/profile BigDoor API end point
    #
    class Profile < ResourceEndUser
        def initialize( hash = {} ) 
            $log.debug( "Profile init with hash = #{hash.inspect}")
            default_values = {
                'provider'       => 'publisher',
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
    end
end
