module BigDoor
    #
    # This module provides Award Resource object 
    # corresponding to /end_user/{id}/award BigDoor API end point
    #
    class Award < ResourceEndUser
        def initialize( hash = {} ) 
            $log.debug( "Award init with hash = #{hash.inspect}")
            default_values = {
                'read_only'       => 0,
                'end_user_login'  => nil,
                'named_award_id'  => nil,
            }
            default_values.merge!( hash )
            $log.debug( "Award default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
