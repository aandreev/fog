module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/delete_instance'

        # Deletes the Instance that the authenticated user manages with the specified :instance_id
        #
        # ==== Parameters
        # * instance_id<~String> - Id of instance
        # 
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     *'success'<~Bool>: true or false for success
        
        def delete_instance(instance_id)
          request(
            :expects  => 200,
            :method   => 'DELETE',
            :path     => "computecloud/enterprise/api/rest/20100331/instances/#{instance_id}"
          )
        end

      end

      class Mock

        def delete_instance(instance_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {"success"=>true}
          response
        end

      end
    end
  end
end
