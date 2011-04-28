module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/upload_key'

        # Uploads existing public key and associates with user
        #
        # ==== Parameters
        # * name<~String> - name to give uploaded key
        # * public_key<~String> - text of public key
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'success'<~Bool>: success status
        
        def upload_key(name, public_key)
          request(
            :expects  => 200,
            :method   => 'POST',
            :path     => "computecloud/enterprise/api/rest/20100331/keys",
            :headers  => { 'Content-Type' => "application/x-www-form-urlencoded" },
            :body     => {
              'name'      => name,
              'publicKey' => public_key
            }
          )
        end

      end

      class Mock

        def upload_key(name, public_key)
          response = Excon::Response.new
          response.status = 200
          response.body = {"success"=>true}
          response
        end

      end
    end
  end
end
