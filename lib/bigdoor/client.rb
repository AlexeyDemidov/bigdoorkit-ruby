require 'restclient'
require 'addressable/uri'
require 'json'
require 'digest/sha1'

module BigDoor

    DEFAULT_APP_HOST = 'http://api.bigdoor.com'

    class Client
        attr_accessor :app_key
        attr_accessor :app_secret
        attr_accessor :app_host

        def initialize( app_key, app_secret, app_host = DEFAULT_APP_HOST )
            @app_key = app_key
            @app_secret = app_secret
            @app_host = app_host

            @base_url = "/api/publisher/#{@app_key}"
        end

        def flatten_params( params )
            raise ArgumentError unless params
            result = ''
            keys = params.keys.sort{|a,b| a <=> b}
            keys.each do |k| 
                next if k == 'sig' 
                next if k == 'format'
                result += "#{k}#{params[k]}"
            end
            result
        end

        def generate_signature( url, params = nil, payload = nil )
            signature = url
            signature += flatten_params( params ) if params
            signature += flatten_params( payload ) if payload 
            signature += @app_secret

            #pp signature

            Digest::SHA256.hexdigest(signature)
        end

        def sign_request( method, url, params, payload )
            params = {} unless params
            payload = {} unless payload

            is_postish = method =~ /^(POST)|(PUT)$/i;
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
            if method =~ /^DELETE$/i && !params.key?('delete_token') 
                params['delete_token'] = self.generate_token
            end

            params['sig'] = self.generate_signature( url, params, payload )
            
            [params, payload]
        end

        def get( url, params = nil)
            do_request( :get, url, params)
        end

        def post( url, params, payload )
        end

        def put( url, params, payload )
        end

        def delete( url, params )
        end

        def do_request( method, end_point, params = nil, payload = nil )
            headers = {
                'User-Agent' => "BigDoorKit-Ruby/#{VERSION}",
                'Content-Type' => 'application/x-www-form-urlencoded'
            }

            params, payload = sign_request( method, @base_url + end_point, params, payload )

            url = Addressable::URI.parse( @app_host + @base_url + end_point )
            url.query_values = params
            
            puts '----'
            pp url.to_s
            pp params
            pp payload
            puts '----'

            response = RestClient::Request.execute(:method => method, :url => url.to_s, :payload => payload, :headers => headers, :raw_response => false)
            decoded_response = JSON.parse( response )
            pp decoded_response[0]
            decoded_response[0]
        end
    end
end