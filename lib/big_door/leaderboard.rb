module BigDoor
    #
    # This module provides Leaderboard Resource object 
    # corresponding to /leaderboard BigDoor API end point
    #
    class Leaderboard < Resource
        ##
        # Initialize new Leaderboard object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
        def initialize( hash = {} ) 
            $log.debug( "Leaderboard init with hash = #{hash.inspect}")
            default_values = { }
            default_values.merge!( hash )
            $log.debug( "Leaderboard default_values = #{default_values.inspect}")
            super( default_values )
        end
        ##
        # Executes Leaderboard retrieval
        #
        #  @param [Hash] params
        #    request params
        #
        #  @param [BigDoor::Client] client
        #    Initialized BigDoor::Client object
        #
        #  @return [Array] array of Hashes representing Leaderboard
        #
        def execute( params, client )
            $log.debug('execute leaderboard');

            uri = sprintf '%s/execute', end_point

            $log.debug( sprintf 'execute uri = %s', uri )
            result = client.get( uri , params )
            $log.debug(sprintf 'result = %s', result.inspect );
        end
    end
end
