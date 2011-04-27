module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/get_storage'

        # Used to retrieve the specified storage volume for specified storage_id
        #
        # ==== Parameters
        # * storage_id<~String> - Id of storage
        # 
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'name'<~String>: instance name
        #     * 'location'<~String>: instance location id
        #     * 'keyName'<~String>: instance assigned keypair
        #     * 'primaryIP'<~Hash>: assigned ip address, type, and hostname
        #     * 'productCodes'<~Array>: associated product codes
        #     * 'requestId'<~String>: 
        #     * 'imageId'<~String>: 
        #     * 'launchTime'<~Integer>: UNIX time integer representing when the instance was launched
        #     * 'id'<~String>: instance id
        #     * 'volumes'<~Array>: 
        #     * 'root-only'<~Boolean>: instance id
        #     * 'instanceType'<~String>: instance type
        #     * 'diskSize'<~String>: instance disk size
        #     * 'requestName'<~String>: instance request name
        #     * 'secondaryIP'<~Array>: additional IP Addresses associated with this instance
        #     * 'status'<~Integer>: instance status flag
        #     * 'software'<~Array>: Software associated with this instance
        #       * 'application'<~Hash>: Application name, type, and version (primarily OS information)
        #     * 'expirationTime'<~Integer>: UNIX timestamp representing when the instance expires
        #     * 'owner'<~String>: instance owner
        def get_storage(storage_id)
          request(
            :expects  => 200,
            :method   => 'GET',
            :path     => "computecloud/enterprise/api/rest/20100331/storage/#{storage_id}"
          )
        end

      end

      class Mock

        def get_storage(storage_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "name"      => "Deep Thought",
            "location"  => "101",
            "keyName"   => "h2g2",
            "primaryIP" => { "type"=>0, "ip"=>"42.42.42.42", "hostname"=> "deep.thought.org" },
            "productCodes"  => [],
            "requestId" => "73846",
            "imageId"   => "20018425",
            "launchTime"=> 1,
            "id"        => "42",
            "volumes"   => [],
            "root-only" => "false",
            "instanceType"  => "COP32.1/2048/60",
            "diskSize"  => "60",
            "requestName" => "What is the answer to the Ultimate Question?",
            "secondaryIP"=> [],
            "status"    => 1,
            "software"  =>
              [{"name"=>"SUSE Linux Enterprise Server",
                "type"=>"OS",
                "version"=>"11 SP1"}],
            "expirationTime"=>1366614000000,
            "owner"=>"loonquawl@thought.org"
          }
          response
        end

      end
    end
  end
end
