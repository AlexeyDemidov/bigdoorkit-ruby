module BigDoor
    #
    # This module provides Attribute Resource object 
    # corresponding to /attribute BigDoor API end point
    #
    class Attribute < Resource
        def initialize( hash = {} ) 
            $log.debug( "Attribute init with hash = #{hash.inspect}")
            default_values = {
                'read_only'   => 1,
                'friendly_id' => nil,
                'attributes'  => [],
            }
            default_values.merge!( hash )
            $log.debug( "Attribute default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
