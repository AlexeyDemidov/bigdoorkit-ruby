require 'ostruct'
require 'logger'

module BigDoor
    class Resource < OpenStruct
        ##
        # 
        # This class provides base class for Resource objects 
        #
        

        ##
        # Initialize new Resource object with optional Hash 
        #
        # @param [Hash] hash 
        #   Optional fields to assign to object
        #
        def initialize( hash = {}) 
            $log.debug( "Resource init with hash = #{hash.inspect}")
            default_values = {
                'pub_title'            => '',
                'pub_description'      => '',
                'end_user_title'       => '',
                'end_user_description' => '',
            }
            default_values.merge!( hash )
            $log.debug( "Resource default_values = #{default_values.inspect}")

            if default_values.key?('id')
                default_values['resource_id'] = default_values['id']
                default_values.delete('id')
            end
            super( default_values )
        end

        ##
        # Derieve API end point form Class name
        #
        #  @param [String] Class name
        #
        #  @return [String] resource name
        #
        def self.end_point_from_classname( name )
            # FIXME should fail if name = Resource
            $log.debug("end_point_from_classname called with name = #{name}")
            if name =~ /BigDoor::(.+)$/
                resource_name = $1

                $log.debug("resource_name = #{resource_name}")

                resource_name.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2');
                resource_name.gsub!(/([a-z\d])([A-Z])/, '\1_\2');
                # FIXME if no match
                resource_name.downcase!

            else
                # FIXME if no match
            end
            $log.debug("resource_name = #{resource_name}")
            resource_name
        end

        ##
        # Derieve API end point form Class name
        #
        #  @return [String] resource name
        #
        def end_point
            Resource.end_point_from_classname( self.class.name )
        end
        
        ##
        # Derieve API end point form Class name
        #
        #  @return [String] resource name
        #
        def self.end_point
            end_point_from_classname( self.name )
        end

        ##
        # Get Resource id for Resource Object. To be overriden in child classes.
        #
        #  @return [String] resource ID
        #
        def get_id 
            self.resource_id
        end

        ##
        # Convert object content to Hash
        #
        # @return [Hash] Object fields 
        #
        def instance_to_payload
            payload = {}
            @table.each do |key, value|
                payload[key] = value
            end
            payload
        end

        ##
        # Sets object fields to values from response Hash
        #
        #  @param [Hash] response
        #    Hash representing decoded JSON response from API
        #
        #  @return nothing  
        #
        def response_to_instance( response )
            $log.debug('update instance from response')
            response.each do |key, value|
                key = 'resource_id' if key == 'id' 
                value = value.to_s
                value.gsub!(/'/, "\\\\'")
                self.instance_eval("self.#{key} = \'#{value}\'")
                $log.debug(sprintf "%s = %s", key, self.instance_eval("self.#{key}") )
            end
        end

        ##
        # Saves Resource object. If object has +id+ attribute defined than
        # +PUT+ method is used, otherwise +POST+ is used.
        #
        #  @param [BigDoor::Client] client
        #    Initialized BigDoor::Client object
        #
        #  @return nothing
        #
        def save( client )
            uri = end_point
            $log.debug( "end_point = #{uri}")
            payload = instance_to_payload
            if payload.key?(:resource_id)
                $log.debug('PUT');
                response = client.put( sprintf("%s/%s", uri, self.get_id ), { 'format' => 'json' }, payload )
            else
                $log.debug('POST');
                response = client.post( "#{uri}", { 'format' => 'json' }, payload )
            end
            response_to_instance( response )
        end

        ##
        # Loads Resource object identified by optional ID parameter or by
        # object own resource_id
        #
        #  @param [BigDoor::Client] client
        #    Initialized BigDoor::Client object
        #
        #  @param [String] id
        #    Object resource ID
        #
        #  @return nothing
        #
        def load( client, id = nil) 
            id = self.get_id unless id
            raise ArgumentError.new('Pass id as param or set resource_id for object ') unless id
            $log.debug('GET');
            response = client.get( sprintf("%s/%s", end_point, id), { 'format' => 'json' })
            response_to_instance( response )
        end

        ##
        # Deletes Resource object identified by optional ID parameter or by
        # object own resource_id
        #
        #  @param [BigDoor::Client] client
        #    Initialized BigDoor::Client object
        #
        #  @param [String] id
        #    Object resource ID
        #
        #  @return nothing
        #
        def delete( client, id = nil)
            # FIXME if id defined - should use class method
            id = self.resource_id unless id
            # FIXME if no id defined
            client.delete( (sprintf "%s/%s", end_point, id), { 'format' => 'json' })
            self.resource_id = nil
        end

        ##
        # Loads all Resource objects by this type
        #
        #  @param [BigDoor::Client] client
        #    Initialized BigDoor::Client object
        #
        #  @return [Array] Array of BigDoor::Resource derieved objects
        #
        def self.all( client )
            uri = end_point
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
    end
end
