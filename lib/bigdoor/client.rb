require 'restclient'
require 'addressable/uri'
require 'json'
require 'digest/sha1'
require 'uuidtools'

module BigDoor
    #
    # This module provides interface to BigDoor public REST API
    #
    DEFAULT_APP_HOST = 'http://api.bigdoor.com'

    class Client
        attr_accessor :app_key
        attr_accessor :app_secret
        attr_accessor :app_host

        ##
        # Creates new BigDoor::Client object
        #
        # @param app_secret
        #
        #   The API secret supplied by BigDoor. (see API Keys http://publisher.bigdoor.com/)
        #
        # @param app_key
        #
        #   The API key supplied by BigDoor. (see API Keys http://publisher.bigdoor.com/)
        #
        def initialize( app_secret, app_key, app_host = DEFAULT_APP_HOST )
            @app_key = app_key
            @app_secret = app_secret
            @app_host = app_host

            @base_url = "/api/publisher/#{@app_key}"
        end

        ##
        #
        # 
        #
        def flatten_params( params )
            raise ArgumentError.new('params should be defined') unless params
            result = ''
            keys = params.keys.sort{|a,b| a.to_s <=> b.to_s}
            keys.each do |key| 
                next if key == 'sig' 
                next if key == 'format'
                result += "#{key}#{params[key]}"
            end
            $log.debug(sprintf "flatten_params = %s", result )
            result
        end

        def generate_signature( url, params = nil, payload = nil )
            signature = url
            signature += flatten_params( params ) if params
            signature += flatten_params( payload ) if payload 
            signature += @app_secret

            $log.debug(sprintf "signature = %s", signature )

            Digest::SHA256.hexdigest(signature)
        end

        def generate_token
            UUIDTools::UUID.random_create.hexdigest
        end

        def add_required_params( method, params, payload )
            raise ArgumentError.new('unkown method') unless [:get, :put, :post, :delete].include?(method)

            params = {} unless params
            payload = {} unless payload
            
            is_postish = [:post, :put].include?(method)

            if is_postish && payload.key?('time')
                params['time'] = payload['time']
            end
            if params && !params.key?('time')
                params['time'] = Time.now.to_i.to_s
            end
            if is_postish && !payload.key?('time')
                payload['time'] = params['time']
            end

            if is_postish && !payload.key?('token')
                payload['token'] = self.generate_token
            end
            
            if method == :delete && !params.key?('delete_token') 
                params['delete_token'] = self.generate_token
            end

            [params, payload]
        end

        def sign_request( method, url, params, payload )

            params, payload = add_required_params( method, params, payload )

            params['sig'] = self.generate_signature( url, params, payload )
            
            [params, payload]
        end

        def get( url, params = nil)
            do_request( :get, url, params)
        end

        def post( url, params, payload )
            do_request( :post, url, params, payload)
        end

        def put( url, params, payload  )
            do_request( :put, url, params, payload)
        end

        def delete( url, params = nil)
            do_request( :delete, url, params)
        end

        def do_request( method, end_point, params = nil, payload = nil )
            headers = {
                'User-Agent' => "BigDoorKit-Ruby/#{VERSION}",
            }
            
            if [:post, :put].include?(method)
                headers['Content-Type'] = 'application/x-www-form-urlencoded'
            end

            params, payload = sign_request( method, @base_url + '/' + end_point, params, payload )

            url = Addressable::URI.parse( @app_host + @base_url + '/' + end_point )
            $log.debug( sprintf 'url  object = %s', url.inspect )
            $log.debug( sprintf 'params = %s', params.inspect )
            url.query_values = params

            $log.debug( sprintf 'method url = %s %s', method, url )
            $log.debug( sprintf 'payload = %s', payload.inspect )
            
            response = RestClient::Request.execute(:method => method, :url => url.to_s, :payload => payload, :headers => headers, :raw_response => false)
            #pp response
            if response && !response.empty?
                decoded_response = JSON.parse( response )
                $log.debug( sprintf 'decoded_response = %s', decoded_response.inspect )
                decoded_response[0]
            end
        rescue RestClient::Exception => ex
            $log.debug(sprintf 'Error response body: %s', ex.http_body)
        end
    end
end
