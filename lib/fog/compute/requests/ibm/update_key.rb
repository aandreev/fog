module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/update_key'

        # Uploads public key to overwrite key with the name specified
        #
        # ==== Parameters
        # * key_name<~String> - name of key to be updated
        # * public_key<~String> - public key text to be written to key
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'success'<~Bool>: success status of update request
        #
                
        def update_key(key_name, public_key)
          request(
            :expects  => 200,
            :method   => 'PUT',
            :path     => "computecloud/enterprise/api/rest/20100331/keys/#{key_name}",
            :body     => {
              'publicKey'   => public_key
            }
          )
        end

      end

      class Mock

        def update_key(instance_id, key_name)
          response = Excon::Response.new
          response.status = 200
          response.body = {"success"=>true}
          response
        end

      end
    end
  end
end
