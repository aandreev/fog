module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/set_instance_expiration'

        # Sets new expiration time for instance
        #
        # ==== Parameters
        # * instance_id<~String> - id of instance to update
        # * expiration_time<~Integer> - expiration time of instance (epoch)
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'expirationTime'<~Integer>: new expiration time of instance (epoch)
        #
                
        def set_instance_expiration(instance_id, expiration_time)
          request(
            :expects  => 200,
            :method   => 'PUT',
            :path     => "computecloud/enterprise/api/rest/20100331/instances/#{instance_id}",
            :body    => {
              'expirationTime'       => expiration_time
            }
          )
        end

      end

      class Mock

        def set_instance_expiration(instance_id, expiration_time)
          response = Excon::Response.new
          response.status = 200
          response.body = {"expirationTime"=>1367014363200}
          response
        end

      end
    end
  end
end
