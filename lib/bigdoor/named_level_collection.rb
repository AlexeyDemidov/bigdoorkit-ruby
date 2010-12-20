module BigDoor
    #
    # This module provides NamedLevelCollection Resource object 
    # corresponding to /named_level_collection BigDoor API end point
    #
    class NamedLevelCollection < Resource
        def initialize( hash = {} ) 
            $log.debug( "NamedLevelCollection init with hash = #{hash.inspect}")
            default_values = {
                'currency_id'  => nil,
                'read_only'    => 0,
                'named_levels' => [],
                'attributes'   => [],
                'urls'         => [],
            }
            default_values.merge!( hash )
            $log.debug( "NamedLevelCollection default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
