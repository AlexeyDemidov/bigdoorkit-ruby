module BigDoor

    #
    # This module provides Resource class with Association
    #
    
    class ResourceWithAssociation < Resource
        def associate_with(resource, client, payload = {})
            $log.debug('associate_with');

            uri = sprintf '%s/%s/%s/%s', 
                end_point, 
                self.resource_id, 
                resource.resource_name, 
                resource.resource_id

            $log.debug( sprintf 'uri = %s', uri )
            result = client.post( uri , { 'format' => 'json'}, payload )
            $log.debug(sprintf 'result = %s', result.inspect );
        end
    end
end
