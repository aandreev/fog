module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/list_instances'

        # Returns list of instances that the authenticated user manages.
        #
        # ==== Parameters
        # 
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'instances'<~Array>: list of instances
        #       * 'name'<~String>: instance name
        #       * 'location'<~String>: instance location id
        #       * 'keyName'<~String>: instance assigned keypair
        #       * 'primaryIP'<~Hash>: assigned ip address, type, and hostname
        #       * 'productCodes'<~Array>: associated product codes
        #       * 'requestId'<~String>: 
        #       * 'imageId'<~String>: 
        #       * 'launchTime'<~Integer>: UNIX time integer representing when the instance was launched
        #       * 'id'<~String>: instance id
        #       * 'volumes'<~Array>: 
        #       * 'root-only'<~Boolean>: instance id
        #       * 'instanceType'<~String>: instance type
        #       * 'diskSize'<~String>: instance disk size
        #       * 'requestName'<~String>: instance request name
        #       * 'secondaryIP'<~Array>: additional IP Addresses associated with this instance
        #       * 'status'<~Integer>: instance status flag
        #       * 'software'<~Array>: Software associated with this instance
        #         * 'application'<~Hash>: Application name, type, and version (primarily OS information)
        #       * 'expirationTime'<~Integer>: UNIX timestamp representing when the instance expires
        #       * 'owner'<~String>: instance owner
        def list_instances()
          request(
            :expects  => 200,
            :method   => 'GET',
            :path     => "computecloud/enterprise/api/rest/20100331/instances/"
          )
        end

      end

      class Mock

        def get_instance(instance_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {"instances"=>
            [{"name"=>"node1",
              "location"=>"101",
              "keyName"=>"h2g2",
              "primaryIP"=>
               {"type"=>0, "ip"=>"42.42.42.42 ", "hostname"=>"42.42.42.42 "},
              "productCodes"=>[],
              "requestId"=>"72915",
              "imageId"=>"20018425",
              "launchTime"=>1303350023348,
              "id"=>"42",
              "volumes"=>[],
              "root-only"=>"true",
              "instanceType"=>"SLV32.2/4096/60*350",
              "diskSize"=>"60",
              "requestName"=>"node1",
              "secondaryIP"=>[],
              "status"=>5,
              "software"=>
               [{"name"=>"SUSE Linux Enterprise Server",
                 "type"=>"OS",
                 "version"=>"11 SP1"}],
              "expirationTime"=>1366354800000,
              "owner"=>"loonquawl@thought.org"},
             {"name"=>"node2",
              "location"=>"101",
              "keyName"=>"h2g2",
              "primaryIP"=>
               {"type"=>0, "ip"=>"43.43.43.43 ", "hostname"=>"43.43.43.43 "},
              "productCodes"=>[],
              "requestId"=>"74270",
              "imageId"=>"20020159",
              "launchTime"=>1303753170314,
              "id"=>"43",
              "volumes"=>[],
              "root-only"=>"true",
              "instanceType"=>"SLV32.2/4096/60*350",
              "diskSize"=>"60",
              "requestName"=>"node2",
              "secondaryIP"=>[],
              "status"=>5,
              "software"=>
               [{"name"=>"SUSE Linux Enterprise Server",
                 "type"=>"OS",
                 "version"=>"11 SP1"}],
              "expirationTime"=>1366786800000,
              "owner"=>"vroomfondel@thought.org"}]}
          response
        end

      end
    end
  end
end
