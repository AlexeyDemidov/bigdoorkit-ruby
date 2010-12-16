module BigDoor
    class Resource

        def save( client )
            uri = '/currency'
            payload = {}
            client.post( uri, { 'format' => 'json' }, payload )
        end

        def load( client, id = nil)
        end

        def remove( client, id = nil)
        end

        def self.all( client )
            uri = '/currency'
            client.get( uri, { 'format' => 'json' } )
        end
    end
end
