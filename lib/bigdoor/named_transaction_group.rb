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
        def execute( end_user_login, payload, client )
            $log.debug('execute transaction');

            # FIXME check for self.resource_id defined
            # FIXME check end_user_login 
            uri = sprintf '%s/%s/execute/%s', 
                end_point, 
                self.resource_id, 
                end_user_login

            $log.debug( sprintf 'uri = %s', uri )
            result = client.post( uri , { 'format' => 'json'}, payload )
            $log.debug(sprintf 'result = %s', result.inspect );
        end
    end
end
