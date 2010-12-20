module BigDoor
    #
    # This module provides EndUser Resource object 
    # corresponding to /end_user BigDoor API end point
    #
    class EndUser < Resource
        def initialize( hash = {} ) 
            $log.debug( "EndUser init with hash = #{hash.inspect}")
            default_values = {
                'end_user_login'          => '',
                'guid'                    => '',
                'best_guess_name'         => '',
                'best_guess_profile_img'  => '',
                'award_summaries'         => [],
                'level_summaries'         => [],
                'sent_good_summaries'     => [],
                'received_good_summaries' => [],
                'currency_balances'       => [],
                'read_only'               => 0,
            }
            default_values.merge!( hash )
            $log.debug( "EndUser default_values = #{default_values.inspect}")
            super( default_values )
        end
    end
end
