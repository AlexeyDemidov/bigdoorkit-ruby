module BigDoor
    #
    # This module provides Leaderboard Resource object 
    # corresponding to /leaderboard BigDoor API end point
    #
    class Leaderboard < Resource
        def initialize( hash = {} ) 
            $log.debug( "Leaderboard init with hash = #{hash.inspect}")
            default_values = {
                'results'  => [],
                'max_rank' => nil,
            }
            default_values.merge!( hash )
            $log.debug( "Leaderboard default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
