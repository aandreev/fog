module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/set_default_key'

        # Makes a key the default key 
        #
        # ==== Parameters
        # * key_name<~String> - name of key to be set as default
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'success'<~Bool>: success status of update request
        #
                
        def set_default_key(key_name)
          request(
            :expects  => 200,
            :method   => 'PUT',
            :path     => "computecloud/enterprise/api/rest/20100331/keys/#{key_name}",
            :body     => {
              'default'   => true
            }
          )
        end

      end

      class Mock

        def set_default_key(key_name)
          response = Excon::Response.new
          response.status = 200
          response.body = {"success"=>true}
          response
        end

      end
    end
  end
end
