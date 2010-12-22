module BigDoor
    #
    # This module provides EndUser Resource object 
    # corresponding to /end_user BigDoor API end point
    #
    class EndUser < Resource
        def initialize( hash = {} ) 
            $log.debug( "EndUser init with hash = #{hash.inspect}")
            default_values = {
                'end_user_login'          => '',
            }
            default_values.merge!( hash )
            $log.debug( "EndUser default_values = #{default_values.inspect}")
            super( default_values )
        end
        def resource_id
            self.end_user_login
        end
    end
end
