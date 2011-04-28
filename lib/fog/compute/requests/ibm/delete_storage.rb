module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/delete_storage'

        # Deletes the storage that the authenticated user manages with the specified :storage_id
        #
        # ==== Parameters
        # * storage_id<~String> - Id of storage
        # 
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     *'success'<~Bool>: true or false for success
        
        def delete_storage(storage_id)
          request(
            :expects  => 200,
            :method   => 'DELETE',
            :path     => "computecloud/enterprise/api/rest/20100331/storage/#{storage_id}"
          )
        end

      end

      class Mock

        def delete_storage(storage_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {"success"=>true}
          response
        end

      end
    end
  end
end
