module BigDoor
    #
    # This module provides Award Resource object 
    # corresponding to /end_user/{id}/award BigDoor API end point
    #
    class Award < ResourceEndUser
        ##
        # Initialize new Award object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
        def initialize( hash = {} ) 
            $log.debug( "Award init with hash = #{hash.inspect}")
            default_values = {
                'end_user_login'  => nil,
                'named_award_id'  => nil,
            }
            default_values.merge!( hash )
            $log.debug( "Award default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
