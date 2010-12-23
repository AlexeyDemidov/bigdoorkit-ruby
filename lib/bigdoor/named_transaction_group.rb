module BigDoor
    #
    # This module provides NamedTransactionGroup Resource object 
    # corresponding to /named_transaction_group BigDoor API end point
    #
    class NamedTransactionGroup < ResourceWithAssociation
        def initialize( hash = {} ) 
            $log.debug( "NamedTransactionGroup init with hash = #{hash.inspect}")
            default_values = {
                'end_user_cap'               => 0,
                'end_user_cap_interval'      => 0,
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
            payload ||= { 'verbosity' => '6' }
            result = client.post( uri , { 'format' => 'json'}, payload )
            $log.debug(sprintf 'result = %s', result.inspect );
        end
        def associate_with( resource, client, primary = 1)
            super( resource, client, {'named_transaction_is_primary' => primary } )
        end
    end
end
