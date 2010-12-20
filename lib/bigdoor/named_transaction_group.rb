module BigDoor
    #
    # This module provides NamedTransactionGroup Resource object 
    # corresponding to /named_transaction_group BigDoor API end point
    #
    class NamedTransactionGroup < Resource
        def initialize( hash = {} ) 
            $log.debug( "NamedTransactionGroup init with hash = #{hash.inspect}")
            default_values = {
                'end_user_cap'               => 0,
                'end_user_cap_interval'      => 0,
                'non_secure'                 => 1,
                'challenge_response_enabled' => 0,
                'urls'                       => [],
                'named_transactions'         => [],
                'read_only'                  => 0,
            }
            default_values.merge!( hash )
            $log.debug( "NamedTransactionGroup default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
