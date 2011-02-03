module BigDoor

    #
    # This module provides Resource class with Association
    #
    
    class ResourceWithAssociation < Resource
        ##
        # Assocaiate this Resource with another Resource
        #
        #  @param [BigDoor::Resource] resource
        #    Resource to be associated with. See BigDoor documentation for list
        #    of objects which allow association
        #
        #  @param [BigDoor::Client] client
        #    Initialized BigDoor::Client object
        #
        #  @param [Hash] payload
        #    Hash to be converted to HTTP POST form-url-encoded body
        #
        #  @return [Hash] Decoded JSON response if any
        #  
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
            result
        end
    end
end
