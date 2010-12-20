module BigDoor
    #
    # This module provides CurrencyBalance Resource object 
    # corresponding to /end_user/{id}/currency_balance BigDoor API end point
    #
    class CurrencyBalance < Resource
        def initialize( hash = {} ) 
            $log.debug( "CurrencyBalance init with hash = #{hash.inspect}")
            default_values = {
                'read_only'            => 0,
                'adjustment_amount'    => 0,
                'curr_balance'         => 0,
                'prev_balance'         => 0,
                'transaction_group_id' => nil,
            }
            default_values.merge!( hash )
            $log.debug( "CurrencyBalance default_values = #{default_values.inspect}")
            super( default_values )
        end

        def parent_end_point 
            'end_user'
        end

        def parent_id_attr
            'end_user_login'
        end
    end
end
