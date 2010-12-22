module BigDoor

    #
    # This module provides Resource class with Parent
    #
    
    class ResourceWithParent < Resource
        def associate_with( client, resource )
        end

        def end_point
            $log.debug("parent_end_point = #{parent_end_point}")
            $log.debug("parent_id_attr = #{parent_id_attr}")
            $log.debug("parent_id_attr value = #{self.instance_eval("self.#{parent_id_attr}")}")

            # FIXME if parent_id_attr empty
            # FIXME if no self.#{parent_id_attr}
            ep = sprintf "%s/%s/%s", 
                parent_end_point,
                self.instance_eval("self.#{parent_id_attr}"),
                Resource.end_point_from_classname( self.class.name )
            ep
        end

        def parent_end_point 
            resource_name = Resource.end_point_from_classname( self.class.name )
            "#{resource_name}_collection"
        end

        def parent_id_attr
            "#{parent_end_point}_id"
        end
    end
end
