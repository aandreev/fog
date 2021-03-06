module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/list_addresses'

        # Returns the list of static IP addresses for current user
        #
        # ==== Parameters
        # No parameters
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'addresses'<~Array>: list of addresses
        #       * 'location'<~String>: location of address
        #       * 'mode'<~Integer>: 
        #       * 'offeringId'<~String>: offering ID
        #       * 'id'<~String>: id
        #       * 'type'<~Integer>: TODO unsure
        #       * 'ip'<~String>: IP address.. with space at the end
        #       * 'hostname'<~String>: seems to be same as ip
        #       * 'state'<~Integer>: state of address
        
        def list_addresses()
          request(
            :expects  => 200,
            :method   => 'GET',
            :path     => "computecloud/enterprise/api/rest/20100331/addresses"
          )
        end

      end

      class Mock

        def list_addresses()
          response = Excon::Response.new
          response.status = 200
          response.body = {"addresses"=>
              [{"location"=>"101",
                "mode"=>0,
                "offeringId"=>"20001223",
                "id"=>"75321",
                "type"=>1,
                "ip"=>"170.224.192.210 ",
                "hostname"=>"170.224.192.210 ",
                "state"=>2}]},
          response
        end

      end
    end
  end
end
