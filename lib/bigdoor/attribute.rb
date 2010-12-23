module BigDoor
    #
    # This module provides Attribute Resource object 
    # corresponding to /attribute BigDoor API end point
    #
    class Attribute < ResourceWithAssociation
        def initialize( hash = {} ) 
            $log.debug( "Attribute init with hash = #{hash.inspect}")
            default_values = { }
            default_values.merge!( hash )
            $log.debug( "Attribute default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
