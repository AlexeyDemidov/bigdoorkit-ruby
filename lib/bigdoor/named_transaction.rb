module BigDoor
    #
    # This module provides NamedTransaction Resource object 
    # corresponding to /named_transaction BigDoor API end point
    #
    class NamedTransaction < Resource
        def initialize( hash = {} ) 
            $log.debug( "NamedTransaction init with hash = #{hash.inspect}")
            default_values = { }
            default_values.merge!( hash )
            $log.debug( "NamedTransaction default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
