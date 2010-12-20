module BigDoor
    #
    # This module provides CurrencyType Resource object 
    # corresponding to /currency_type BigDoor API end point
    #
    class CurrencyType < Resource
        def initialize( hash = {} ) 
            $log.debug( "CurrencyType init with hash = #{hash.inspect}")
            default_values = {
                'read_only'                          => 1,
                'title'                              => '',
                'description'                        => '',
                'has_dollar_exchange_rate_integrity' => 0,
                'can_be_cross_publisher'             => 0,
                'can_be_purchased'                   => 0,
                'can_be_rewarded'                    => 0,
            }
            default_values.merge!( hash )
            $log.debug( "CurrencyType default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
