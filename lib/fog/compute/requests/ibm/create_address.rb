module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/create_address'

        # Requests a new static IP address to be created
        #
        # ==== Parameters
        # * location<~String> - id of location
        # * offering_id<~String> - id for offering 
        # * vlan_id<~String> - 
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'location'<~String>: location of new address
        #     * 'offeringId'<~String>: offering id of new address
        #     * 'id'<~String>: id
        #     * 'ip'<~String>: returns string of spaces (ip not yet allocated right after creation)
        #     * 'state'<~Integer>: status of address (0 when new)
        
        def create_address(location, offering_id, vlan_id="")
          request(
            :expects  => 200,
            :method   => 'POST',
            :path     => "computecloud/enterprise/api/rest/20100331/addresses",
            :headers  => { 'Content-Type' => "application/x-www-form-urlencoded" },
            :query    => {
              'location'    => location,
              'offeringID'  => offering_id,
              'vlanID'      => vlan_id
            }
          )
        end

      end

      class Mock

        def create_address(location, offering_id, vlan_id="")
          response = Excon::Response.new
          response.status = 200
          response.body = {"location"=>"101",
             "offeringId"=>"20001223",
             "id"=>"75346",
             "ip"=>"                ",
             "state"=>0}
          response
        end

      end
    end
  end
end
