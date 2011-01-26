module BigDoor

    #
    # This module provides Resource class with EndUser Parent
    #
    
    class ResourceEndUser < Resource
        ##
        # Calculates Resource object API end point from its class name using
        # parent_end_point and parent_id_attr (possibly overriden in child classes)
        #
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

        ##
        # Calculates Resource object API end point from its class name using
        # parent_end_point and parent_id_attr (possibly overriden in child classes)
        #
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
        
        ##
        # Loads all Resource objects by this type
        #
        #  @param [String] username
        #    end_user_login to be used as base API end point
        #
        #  @param [BigDoor::Client] client
        #    Initialized BigDoor::Client object
        #
        #  @return [Array] Array of BigDoor::Resource derieved objects
        #
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

        ##
        # Gives default base parent_end_point for object. 
        # Can be overriden in inherited classes.
        #
        def self.parent_end_point 
            'end_user'
        end

        ##
        # Gives default parent_id attribute name for object.
        # Can be overriden in inherited classes.
        # 
        def parent_id_attr
            'end_user_login'
        end
    end
end
