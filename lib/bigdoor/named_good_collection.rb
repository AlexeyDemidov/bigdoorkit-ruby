module BigDoor
    #
    # This module provides NamedGoodCollection Resource object 
    # corresponding to /named_good_collection BigDoor API end point
    #
    class NamedGoodCollection < Resource
        def initialize( hash = {} ) 
            $log.debug( "NamedGoodCollection init with hash = #{hash.inspect}")
            default_values = {
            }
            default_values.merge!( hash )
            $log.debug( "NamedGoodCollection default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
