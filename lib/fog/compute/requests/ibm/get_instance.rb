module Fog
  module IBM
    class Compute
      class Real

        require 'fog/compute/parsers/ibm/get_instance'

        # Returns the Instance that the authenticated user manages with the specified :instance_id
        #
        # ==== Parameters
        # * instance_id<~String> - Id of instance
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
        def get_instance(instance_id)
          request(
            :expects  => 200,
            :method   => 'GET',
            :path     => "computecloud/enterprise/api/rest/20100331/instances/#{instance_id}"
          )
        end

      end

      class Mock

        def get_instance(instance_id)
          response = Excon::Response.new
          response.status = 200

          instances_set = []
          reservation_id = Fog::AWS::Mock.reservation_id

          min_count.times do |i|
            instance_id = Fog::IBM::Mock.instance_id
            instance = {
              'amiLaunchIndex'      => i,
              'blockDeviceMapping'  => [],
              'clientToken'         => options['clientToken'],
              'dnsName'             => nil,
              'imageId'             => image_id,
              'instanceId'          => instance_id,
              'instanceState'       => { 'code' => 0, 'name' => 'pending' },
              'instanceType'        => options['InstanceType'] || 'm1.small',
              'kernelId'            => options['KernelId'] || Fog::AWS::Mock.kernel_id,
              # 'keyName'             => options['KeyName'],
              'launchTime'          => Time.now,
              'monitoring'          => { 'state' => options['Monitoring.Enabled'] || false },
              'placement'           => { 'availabilityZone' => options['Placement.AvailabilityZone'] || Fog::AWS::Mock.availability_zone },
              'privateDnsName'      => nil,
              'productCodes'        => [],
              'ramdiskId'           => options['RamdiskId'] || Fog::AWS::Mock.ramdisk_id,
              'reason'              => nil,
              'rootDeviceType'      => 'instance-store'
            }
            instances_set << instance
            @data[:instances][instance_id] = instance.merge({
              'architecture'        => 'i386',
              'groupSet'            => group_set,
              'ownerId'             => @owner_id,
              'privateIpAddress'    => nil,
              'reservationId'       => reservation_id,
              'stateReason'         => {},
              'tagSet'              => {}
            })
          end
          response.body = {
            'groupSet'      => group_set,
            'instancesSet'  => instances_set,
            'ownerId'       => @owner_id,
            'requestId'     => Fog::AWS::Mock.request_id,
            'reservationId' => reservation_id
          }
          response
        end

      end
    end
  end
end
