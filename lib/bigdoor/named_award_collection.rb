module BigDoor
    #
    # This module provides NamedAwardCollection Resource object 
    # corresponding to /named_award_collection BigDoor API end point
    #
    class NamedAwardCollection < Resource
        def initialize( hash = {} ) 
            $log.debug( "NamedAwardCollection init with hash = #{hash.inspect}")
            default_values = {
                'read_only'    => 0,
                'named_awards' => [],
                'non_secure'   => 0,
                'urls'         => [],
            }
            default_values.merge!( hash )
            $log.debug( "NamedAwardCollection default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
