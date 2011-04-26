module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/get_instance'

        # Requests a new Instance to be created.
        #
        # ==== Parameters
        # * name<~String> - The alias to use to reference this instance 
        # * image_id<~String> - The id of the image to create this instance from 
        # * instance_type<~String> - The instance type to use for this instance 
        # * location<~String> - The id of the Location where this instance will be created 
        # * public_key<~String> - The public key to use for accessing the created instance 
        # * options<~Hash>:
        #   * :ip<~String> - The ID of a static IP address to associate with this instance 
        #   * :volume_id<~String> - The ID of a storage volume to associate with this instance 
        #   * :vlan_id<~String> - The ID of a Vlan offering to associate with this instance. 
        #   * :secondary_ip<~String> - The ID of a static IP address to associate with this instance as secondary IP 
        #   * :is_mini_ephermal<~Boolean> - Whether or not the instance should be provisioned with the root segment only
        #   * :configuration_data<~Hash> - Arbitrary name/value pairs defined by the image being created 
        #   * :anti_collocation_instance<~String> - The ID of an existing anti-collocated instance.
        # 
        
        #{
        #“launchTime”:1260472231726, 
        #“software”:[{“version”:”10 SP2”, “type”:”OS”, “name”:”SUSE Linux Enterprise”}], 
        #“ip”:null, 
        #“requestId”:XXX, 
        #“keyName”:$publicKey, 
        #“name”:$name, 
        #“instanceType”:$instanceType, 
        #“status”:0, 
        #“owner”:”aadelucc@us.ibm.com”, 
        #“hostname”:NULL, 
        #“location”:$location 
        #“imageId”:$imageID, 
        #“productCodes”:[], 
        #“requestName”:$name, 
        #“id”:XXX, 
        #“expirationTime”:1263064240837, 
        #“vlan”:{ “id”:”1”, “name”:”vlanname”, “location”:”1” }
        #“DiskSize”: “60”, 
        #“MiniEphemeral“: “true”, 
        #“antiCollocationInstance”: “4546”
        #}
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
        def create_instance(name, image_id, instance_type, location, public_key, options={})
          request(
            :expects  => 200,
            :method   => 'POST',
            :path     => "computecloud/enterprise/api/rest/20100331/instances",
            :query    => {
              'name'          => name,
              'imageID'       => image_id,
              'instanceType'  => instance_type,
              'location'      => location,
              'publicKey'     => public_key,
              'ip'            => options[:ip].to_s,
              'volumeID'      => options[:volume_id].to_s,
              'vlanID'        => options[:vlan_id].to_s,
              'SecondaryIP'   => options[:secondary_ip].to_s,
              'isMiniEphermal'          => options[:is_mini_ephermal].to_s
              'Configuration Data'      => options[:configuration_data].to_s
              'antiCollcationInstance'  => options[:anti_collocation_instance].to_s 
            }
          )
        end

      end

      class Mock

        def create_instance(instance_id)
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
