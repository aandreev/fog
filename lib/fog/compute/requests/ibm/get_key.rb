module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/get_key'

        # Returns details of key by name specified
        #
        # ==== Parameters
        # 'key_name'<~String>: name of key to request
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'keyName'<~String>: Name of key
        #     * 'lastModifiedTime'<~Integer>: epoch time of last modification
        #     * 'default'<~Bool>: bool if key is default for user
        #     * 'instanceIds'<~Array>: list of instances associated with key
        #     * 'keyMaterial'<~String>: public key
        
        
        def get_key(key_name)
          request(
            :expects  => 200,
            :method   => 'GET',
            :path     => "computecloud/enterprise/api/rest/20100331/keys/#{key_name}"
          )
        end

      end

      class Mock

        def get_key(image_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {"keyName"=>"chicks-ibm",
             "lastModifiedTime"=>1303605306354,
             "default"=>false,
             "instanceIds"=>["75064", "74083", "74746", "74747"],
             "keyMaterial"=>
              "AAAAB3NzaC1yc2EAAAADAQABAAABAQDHxyTB9Et..."}
          response
        end

      end
    end
  end
end
