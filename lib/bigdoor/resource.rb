require 'ostruct'
require 'logger'

module BigDoor

    #
    # This module provides base class for Resource objects 
    #
    
    class Resource < OpenStruct
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

                $log.debug("resource_name = #{resource_name}")
            else
                # FIXME if no match
            end
            "/#{resource_name}"
        end

        def end_point
            class_name = self.class.name
            $log.debug("ins class = #{class_name}")
            $log.debug("self.name = #{self.name}")

            ep = Resource.end_point_from_classname( class_name )
            $log.debug("ep = #{ep}")
            if parent_end_point
                $log.debug("parent_end_point = #{parent_end_point}")
                $log.debug("parent_id_attr = #{parent_id_attr}")
                $log.debug("parent_id_attr value = #{self.instance_eval("self.#{parent_id_attr}")}")
                # FIXME if parent_id_attr empty
                # FIXME if no self.#{parent_id_attr}
                ep = sprintf "%s/%s/%s", 
                    parent_end_point,
                    self.instance_eval("self.#{parent_id_attr}")
                    end_point_from_class_name( class_name )
            end
            ep
        end
        
        def self.end_point
            class_name = self.name
            $log.debug("cls class = #{class_name}")
            $log.debug("self.name = #{class_name}")

            end_point_from_classname( class_name )
        end

        def get_id 
            self.resource_id
        end

        def instance_to_payload
            payload = {}
            @table.each do |key, value|
                payload[key] = value
            end
            payload
        end

        def response_to_instance( response )
            $log.debug('update instance from response')
            response.each do |key, value|
                key = 'resource_id' if key == 'id' 
                self.instance_eval("self.#{key} = \'#{value}\'")
                $log.debug(sprintf "%s = %s", key, self.instance_eval("self.#{key}") )
            end
        end

        def save( client )
            uri = end_point
            $log.debug( "end_point = #{uri}")
            payload = instance_to_payload
            if payload.key?(:resource_id)
                $log.debug('PUT');
                response = client.put( sprintf("%s/%s", uri, self.get_id ), { 'format' => 'json' }, payload )
            else
                $log.debug('POST');
                response = client.post( uri, { 'format' => 'json' }, payload )
            end
            response_to_instance( response )
        end

        def load( client, id = nil) 
            id = self.get_id unless id
            raise ArgumentError.new('Pass id as param or set resource_id for object ') unless id
            $log.debug('GET');
            response = client.get( sprintf("%s/%s", end_point, id), { 'format' => 'json' })
            response_to_instance( response )
        end

        def delete( client, id = nil)
            # FIXME if id defined - should use class method
            id = self.resource_id unless id
            # FIXME if no id defined
            client.delete( (sprintf "%s/%s", end_point, id), { 'format' => 'json' })
            self.resource_id = nil
        end

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
