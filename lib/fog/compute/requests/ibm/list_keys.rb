module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/list_keys'

        # Returns the list of keys created on the IBM DeveloperCloud for authenticated users
        #
        # ==== Parameters
        # No parameters
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'keys'<~Array>: list of keys
        #       * 'keyName'<~String>: Name of key
        #       * 'lastModifiedTime'<~Integer>: epoch time of last modification
        #       * 'default'<~Bool>: bool if key is default for user
        #       * 'instanceIds'<~Array>: list of instances associated with key
        #       * 'keyMaterial'<~String>: public key
        
        def list_keys()
          request(
            :expects  => 200,
            :method   => 'GET',
            :path     => "computecloud/enterprise/api/rest/20100331/keys"
          )
        end

      end

      class Mock

        def list_keys()
          response = Excon::Response.new
          response.status = 200
          response.body = {"keys"=>
              [{"keyName"=>"key1",
                "lastModifiedTime"=>1303605306354,
                "default"=>false,
                "instanceIds"=>["75064", "74083", "74746", "74747"],
                "keyMaterial"=>
                 "AAAAB3NzaC1yc2EAAAADAQABAAABA..."},
               {"keyName"=>"key2",
                "lastModifiedTime"=>1303791582051,
                "default"=>false,
                "instanceIds"=>["74081"],
                "keyMaterial"=>
                 "AAAAB3NzaC1yc2EAAAADAQABAAABAQ..."}]}
          response
        end

      end
    end
  end
end
