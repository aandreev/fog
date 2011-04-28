module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/create_key'

        # Requests a new keypair to be created
        #
        # ==== Parameters
        # * name<~String> - name to give new key
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'keyName'<~String>: name of new key
        #     * 'lastModifiedTime'<~Integer>: epoch time of last modification
        #     * 'default'<~Bool>: is default?
        #     * 'instanceIds'<~Array>: id's of instances using key (should be empty upon creation)
        #     * 'keyMaterial'<~String>: private key contents
        
        def create_key(name)
          request(
            :expects  => 200,
            :method   => 'POST',
            :path     => "computecloud/enterprise/api/rest/20100331/keys",
            :headers  => { 'Content-Type' => "application/x-www-form-urlencoded" },
            :body    => {
              'name'    => name,
            }
          )
        end

      end

      class Mock

        def create_key(name)
          response = Excon::Response.new
          response.status = 200
          response.body = {"keyName"=>"mytest",
             "lastModifiedTime"=>1304021373059,
             "default"=>false,
             "instanceIds"=>[],
             "keyMaterial"=>
              "-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQ..."}
          response
        end

      end
    end
  end
end
