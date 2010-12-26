module BigDoor
    #
    # This module provides Currency Resource object 
    # corresponding to /currency BigDoor API end point
    #
    class Currency < Resource
        ##
        # Initialize new Currency object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
        def initialize( hash = {} ) 
            $log.debug( "Currency init with hash = #{hash.inspect}")
            default_values = {
                'currency_type_id' => 1,
                'currency_type_title' => '',
                'exchange_rate' => 1,
                'relative_weight' => 1,
            }
            default_values.merge!( hash )
            $log.debug( "Currency default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
