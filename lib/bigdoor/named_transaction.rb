module BigDoor
    #
    # This module provides NamedTransaction Resource object 
    # corresponding to /named_transaction BigDoor API end point
    #
    class NamedTransaction < Resource
        def initialize( hash = {} ) 
            $log.debug( "NamedTransaction init with hash = #{hash.inspect}")
            default_values = {
                'currency'                => '',
                'currency_id'             => nil,
                'amount'                  => 0,
                'default_amount'          => 0,
                'is_source'               => 0,
                'variable_amount_allowed' => 0,
                'named_good'              => nil,
                'vendor_publisher_title'  => '',
                'attributes'              => [],
                'notifiable_event'        => nil,
                'read_only'               => 0,
            }
            default_values.merge!( hash )
            $log.debug( "NamedTransaction default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
