module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/delete_address'

        # Deletes the Address that the authenticated user manages with the specified :address_id
        #
        # ==== Parameters
        # * address_id<~String> - Id of address
        # 
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     *'success'<~Bool>: true or false for success
        
        def delete_address(address_id)
          request(
            :expects  => 200,
            :method   => 'DELETE',
            :path     => "computecloud/enterprise/api/rest/20100331/addresses/#{address_id}"
          )
        end

      end

      class Mock

        def delete_address(address_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {"success"=>true}
          response
        end

      end
    end
  end
end
