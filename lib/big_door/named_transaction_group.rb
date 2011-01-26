module BigDoor
    #
    # This module provides NamedTransactionGroup Resource object 
    # corresponding to /named_transaction_group BigDoor API end point
    #
    class NamedTransactionGroup < ResourceWithAssociation
        ##
        # Initialize new NamedTransaction object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
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

        ##
        # Executes this NamedTransaction
        #
        #  @param [String] end_user_login
        #    String representing end_use_login 
        #
        #  @param [Hash] payload
        #    Hash to be converted to HTTP POST form-url-encoded body
        #
        #  @param [BigDoor::Client] client
        #    Initialized BigDoor::Client object
        #
        #  @return [Hash] Decoded JSON response if any
        # 
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
            payload['verbosity'] = 9 unless payload['verbosity']
            result = client.post( uri , { 'format' => 'json'}, payload )
            $log.debug(sprintf 'result = %s', result.inspect );
        end

        ##
        # Assocaiate this NamedTransactionGroup with NamedTransaction
        #
        #  @param [BigDoor::NamedTransaction] transaction
        #    NamedTransaction to be associated with
        #
        #  @param [BigDoor::Client] client
        #    Initialized BigDoor::Client object
        #
        #  @param [Fixnum] primary
        #    Indicates whether assocatiate NamedTransaction is primary in this
        #    Named Transaction Group
        #  
        #  @return [Hash] Decoded JSON response if any
        # 
        def associate_with( transaction, client, primary = 1)
            super( transaction, client, {'named_transaction_is_primary' => primary } )
        end
    end
end
