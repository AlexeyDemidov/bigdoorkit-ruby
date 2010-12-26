module BigDoor
    #
    # This module provides Good Resource object 
    # corresponding to /end_user/{id}/good BigDoor API end point
    #
    class Good < ResourceEndUser
        ##
        # Initialize new Good object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
        def initialize( hash = {} ) 
            $log.debug( "Good init with hash = #{hash.inspect}")
            default_values = {
                'named_good_id' => nil,
            }
            default_values.merge!( hash )
            $log.debug( "Good default_values = #{default_values.inspect}")
            super( default_values )
        end

        ##
        # Override parent_id_attr from ResourceEndUser Class
        #
        #  @return [String] Parent Id attribute
        #
        def parent_id_attr
            'good_receiver'
        end
    end
end
