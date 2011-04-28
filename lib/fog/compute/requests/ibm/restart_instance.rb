module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/restart_instance'

        # Requests a restart of the designated instance
        #
        # ==== Parameters
        # * instance_id<~String> - id of instance to save
        # * key_name<~String> - name of key to be inserted into instance upon restart
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'success'<~Bool>: success status of restart request
        #
                
        def restart_instance(instance_id, key_name)
          request(
            :expects  => 200,
            :method   => 'PUT',
            :path     => "computecloud/enterprise/api/rest/20100331/instances/#{instance_id}",
            :body    => {
              'state'       => 'restart',
              'keyName'     => key_name
            }
          )
        end

      end

      class Mock

        def restart_instance(instance_id, key_name)
          response = Excon::Response.new
          response.status = 200
          response.body = {"success"=>true}
          response
        end

      end
    end
  end
end
