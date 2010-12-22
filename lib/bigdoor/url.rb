module BigDoor
    #
    # This module provides URL Resource object 
    # corresponding to /url BigDoor API end point
    #
    class URL < ResourceWithAssociation
        def initialize( hash = {} ) 
            $log.debug( "URL init with hash = #{hash.inspect}")
            default_values = {
                'read_only'   => 1,
                'friendly_id' => nil,
                'attributes'  => [],
            }
            default_values.merge!( hash )
            $log.debug( "URL default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
