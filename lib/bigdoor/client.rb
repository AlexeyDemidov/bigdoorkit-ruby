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
        ##
        # This class provides low-level interface to BigDoor public REST API
        #
        attr_accessor :app_key
        attr_accessor :app_secret
        attr_accessor :app_host

        ##
        # Creates new BigDoor::Client object
        #
        # @param [String] app_secret
        #   The API secret supplied by BigDoor. (see API Keys http://publisher.bigdoor.com/)
        #
        # @param [String] app_key
        #   The API key supplied by BigDoor. (see API Keys http://publisher.bigdoor.com/)
        #
        # @param [String] app_host  
        #   An alternative host to enable use with testing servers.
        #
        def initialize( app_secret, app_key, app_host = DEFAULT_APP_HOST )
            @app_key = app_key
            @app_secret = app_secret
            @app_host = app_host

            @base_url = "/api/publisher/#{@app_key}"
        end

        ##
        # Converts params hash to string
        #
        # @param params 
        #   Hash representing request params, except +sig+ and +format+ fields
        # 
        # @return [String] Request params concatanated 
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

        ##
        #  Generate appropriate request signature given a url and optional
        #  params and payload.
        #
        #  @param [String] url
        #    The full URL, including the base /api/publisher/[app_key]
        #
        #  @param [Hash] params  
        #    The parameters to be sent via the query string.
        #
        #  @param [Hash] payload
        #    The parameters to be sent via the PUT or POST request body.
        #
        #  @return [String] request signature to be sent as +sign+ query param
        #    
        def generate_signature( url, params = nil, payload = nil )
            signature = url
            signature += flatten_params( params ) if params
            signature += flatten_params( payload ) if payload 
            signature += @app_secret

            $log.debug(sprintf "signature = %s", signature )

            Digest::SHA256.hexdigest(signature)
        end

        ##
        # Generate random token for request
        #
        #  @return [String] Random token to be sent as +token+ 
        def generate_token
            UUIDTools::UUID.random_create.hexdigest
        end

        ##
        # Add requered fields to params and payload
        #
        #  @param [Symbol] method 
        #    HTTP request method
        #
        #  @param [Hash] params  
        #    The parameters to be sent via the query string.
        #
        #  @param [Hash] payload
        #    The parameters to be sent via the PUT or POST request body.
        #
        #  @return [Hash, Hash] Updated params and payload
        #
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

        ##
        # Sign request
        #
        #  @param [Symbol] method 
        #    HTTP request method
        #
        #  @param [String] url 
        #    HTTP request URL
        #
        #  @param [Hash] params  
        #    The parameters to be sent via the query string.
        #
        #  @param [Hash] payload
        #    The parameters to be sent via the PUT or POST request body.
        #
        #  @return [Hash, Hash] Updated params and payload 
        #
        def sign_request( method, url, params, payload )

            params, payload = add_required_params( method, params, payload )

            params['sig'] = self.generate_signature( url, params, payload )
            
            [params, payload]
        end

        ##
        # Makes GET HTTP request to API with optional params
        #
        #  @param [String] url 
        #    relative API end point (eg. currency_type/1 )
        #
        #  @param [Hash] params
        #    The parameters to be sent via the query string.
        #
        #  @return [Hash] Decoded JSON response
        #
        def get( url, params = nil)
            do_request( :get, url, params)
        end

        ##
        # Makes POST HTTP request to API with optional params and
        # www-form-urlencoded payload
        #
        #  @param [String] url 
        #    relative API end point (eg. currency_type )
        #
        #  @param [Hash] params
        #    The parameters to be sent via the query string.
        #
        #  @param [Hash] payload
        #    The parameters to be sent via the PUT or POST request body.
        #
        #  @return [Hash] Decoded JSON response
        #
        def post( url, params, payload )
            do_request( :post, url, params, payload)
        end

        ##
        # Makes PUT HTTP request to API with optional params and
        # www-form-urlencoded payload
        #
        #  @param [String] url 
        #    relative API end point (eg. currency/12345 )
        #
        #  @param [Hash] params
        #    The parameters to be sent via the query string.
        #
        #  @param [Hash] payload
        #    The parameters to be sent via the PUT or POST request body.
        #
        #  @return [Hash] Decoded JSON response
        #
        def put( url, params, payload  )
            do_request( :put, url, params, payload)
        end

        ##
        # Makes DELETE HTTP request to API with optional params
        #
        #  @param [String] url 
        #    relative API end point (eg. currency/12345 )
        #
        #  @param [Hash] params
        #    The parameters to be sent via the query string.
        #
        #  @return [String] should return empty string in case of success
        #
        def delete( url, params = nil)
            do_request( :delete, url, params)
        end

        ##
        # Makes HTTP request to API with optional params and 
        # www-form-urlencoded payload
        #
        #   @param [Symbol] method 
        #     HTTP request method
        #
        #  @param [String] url 
        #    relative API end point (eg. currency/12345 )
        #
        #  @param [Hash] params
        #    The parameters to be sent via the query string.
        #
        #  @param [Hash] payload
        #    The parameters to be sent via the PUT or POST request body.
        #
        #  @return [Hash] Decoded JSON response or empty/undefined string
        #
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
