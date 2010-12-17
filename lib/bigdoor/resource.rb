require 'ostruct'

module BigDoor
    #
    # This module provides base class for Resource objects 
    #
    class Resource < OpenStruct
        def initialize( hash = {}) 
            default_values = {
                'pub_title' => '',
                'pub_description' => '',
                'end_user_title' => '',
                'end_user_description' => '',
            }
            default_values.merge( hash )
            super( default_values )
        end

        def end_point
            '/currency'
        end

        def instance_to_payload
            payload = {}
            @table.each do |key, value|
                payload[key] = value
            end
            payload
        end

        def response_to_instance( response )
            response.each do |key, value|
                key = 'resource_id' if key == 'id' 
                self.instance_eval("self.#{key} = \'#{value}\'")
                #puts "#{key} = "
                #pp self.instance_eval("self.#{key}")
            end
        end

        def save( client )
            uri = end_point
            payload = instance_to_payload
            response = client.post( uri, { 'format' => 'json' }, payload )
            response_to_instance( response )
        end

        def load( client, id = nil)
        end

        def delete( client, id = nil)
            id = self.resource_id unless id
            client.delete( (sprintf "%s/%s", end_point, id), { 'format' => 'json' })
        end

        def self.all( client )
            uri = '/currency'
            client.get( uri, { 'format' => 'json' } )
        end
    end
end
