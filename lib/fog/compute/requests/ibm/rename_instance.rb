module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/rename_instance'

        # Renames an instance
        #
        # ==== Parameters
        # * instance_id<~String> - id of instance to rename
        # * name<~String> - name to be assigned to instance
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'success'<~Bool>: success status of restart request
        #
                
        def rename_instance(instance_id, name)
          request(
            :expects  => 200,
            :method   => 'PUT',
            :path     => "computecloud/enterprise/api/rest/20100331/instances/#{instance_id}",
            :body    => {
              'name'       => name
            }
          )
        end

      end

      class Mock

        def rename_instance(instance_id, key_name)
          response = Excon::Response.new
          response.status = 200
          response.body = {"success"=>true}
          response
        end

      end
    end
  end
end
