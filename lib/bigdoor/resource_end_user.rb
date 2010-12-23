module BigDoor

    #
    # This module provides Resource class with EndUser Parent
    #
    
    class ResourceEndUser < Resource
        def end_point
            $log.debug("parent_end_point = #{ResourceEndUser.parent_end_point}")
            $log.debug("parent_id_attr = #{parent_id_attr}")
            $log.debug("parent_id_attr value = #{self.instance_eval("self.#{parent_id_attr}")}")

            # FIXME if parent_id_attr empty
            # FIXME if no self.#{parent_id_attr}
            ep = sprintf "%s/%s/%s", 
                ResourceEndUser.parent_end_point,
                self.instance_eval("self.#{parent_id_attr}"),
                Resource.end_point_from_classname( self.class.name )
            ep
        end

        def self.end_point( username )
            # FIXME code duplication
            $log.debug("parent_end_point = #{ResourceEndUser.parent_end_point}")

            # FIXME if parent_id_attr empty
            # FIXME if no self.#{parent_id_attr}
            ep = sprintf "%s/%s/%s", 
                ResourceEndUser.parent_end_point,
                username,
                Resource.end_point_from_classname( self.name )
            ep
        end
        
        def self.all( username, client )
            # FIXME code duplication
            uri = self.end_point( username )
            $log.debug( "end_point = #{uri}")
            response = client.get( uri, { 'format' => 'json' } )
            $log.debug( "response to all = #{response}")
            allobj = response.map{ |obj| 
                $log.debug("obj = #{obj.inspect}")
                self.new(obj) 
            }
            $log.debug( "allobj = #{allobj.inspect}")
            allobj
        end

        def self.parent_end_point 
            'end_user'
        end

        def parent_id_attr
            'end_user_login'
        end
    end
end
