module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/delete_key'

        # Deletes the key specified with key_name
        #
        # ==== Parameters
        # * key_name<~String> - name of key to be deleted
        # 
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     *'success'<~Bool>: true or false for success
        
        def delete_key(key_name)
          request(
            :expects  => 200,
            :method   => 'DELETE',
            :path     => "computecloud/enterprise/api/rest/20100331/keys/#{key_name}"
          )
        end

      end

      class Mock

        def delete_key(key_name)
          response = Excon::Response.new
          response.status = 200
          response.body = {"success"=>true}
          response
        end

      end
    end
  end
end
