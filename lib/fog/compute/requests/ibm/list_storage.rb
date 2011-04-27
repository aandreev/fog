module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/list_storage'

        # Returns the list of Images available to be provisioned on the IBM DeveloperCloud.
        #
        # ==== Parameters
        # No parameters
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'volumes'<~Array>: list of images
        #       * 'name'<~String>: Name of image
        #       * 'format'<~String>: filesystem volume is formatted with
        #       * 'location'<~String>: datacenter location string
        #       * 'createdTime'<~Integer>: creation time in Epoch int
        #       * 'size'<~String>: size in GB's (as a string)
        #       * 'productCodes'<~Array>: unsure..
        #       * 'offeringId'<~String>: 
        #       * 'id'<~String>: volume id
        #       * 'owner'<~String>: owner's email address
        #       * 'state'<~Integer>: known so far: 4 provisioned, unattached; 5 provisioned, attached
        
        def list_storage()
          request(
            :expects  => 200,
            :method   => 'GET',
            :path     => "computecloud/enterprise/api/rest/20100331/storage"
          )
        end

      end

      class Mock

        def list_storage()
          response = Excon::Response.new
          response.status = 200
          response.body = {"volumes"=>
             [{"name"=>"test",
               "format"=>"ext3",
               "location"=>"101",
               "createdTime"=>1303253410225,
               "size"=>"256",
               "productCodes"=>[],
               "offeringId"=>"20001208",
               "id"=>"8886",
               "owner"=>"user@example.com",
               "state"=>4},
              {"name"=>"test2",
               "format"=>"ext3",
               "location"=>"101",
               "createdTime"=>1303417999193,
               "size"=>"256",
               "productCodes"=>[],
               "offeringId"=>"20001208",
               "id"=>"9101",
               "owner"=>"user@example.com",
               "state"=>4}]},
          response
        end

      end
    end
  end
end
