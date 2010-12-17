module BigDoor
    #
    # This module provides Currency Resource object 
    # corresponding to /currency BigDoor API end point
    #
    class Currency < Resource
        def initialize( hash = {} ) 
            default_values = {
                'currency_type_id' => 1,
                'currency_type_title' => '',
                'exchange_rate' => 1,
                'relative_weight' => 1,
            }
            default_values.merge( hash )
            super( default_values )
        end
    end
end
