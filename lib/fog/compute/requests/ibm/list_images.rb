module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/list_images'

        # Returns the list of Images available to be provisioned on the IBM DeveloperCloud.
        #
        # ==== Parameters
        # No parameters
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'images'<~Array>: list of images
        #       * 'name'<~String>: image name
        #       * 'location'<~String>: instance location id
        #       * 'createdTime'<~Integer>: time created in epoch time
        #       * 'supportedInstanceTypes'<~Array>: list of prices per image
        #         * 'pricePerQuantity'<~Integer>: 
        #         * 'effectiveDate'<~Fixnum>: 
        #         * 'rate'<~Float>: price per unit
        #         * 'countryCode'<~String>: 
        #         * 'unitOfMeasure'<~String>: unit of measurement
        #         * 'currencyCode'<~String>: currency billed in
        #       * 'productCodes'<~Array>: 
        #       * 'id'<~String>: 
        #       * 'documentation'<~String>: link to documentation for image
        #       * 'manifest'<~String>: link to xml manifest file
        #       * 'description'<~String>: text description of image
        #       * 'visibility'<~String>: status of visibilty of image. known values so far are "PUBLIC" and "PRIVATE"
        #       * 'platform'<~String>: operating system
        #       * 'architecture'<~String>: architecture supported by image
        #       * 'documentation'<~String>: link to documentation for image
        #       * 'owner'<~String>: owner of image
        #       * 'state'<~Integer>: state of availability of image 
        
        
        def list_images()
          request(
            :expects  => 200,
            :method   => 'GET',
            :path     => "computecloud/enterprise/api/rest/20100331/offerings/image"
          )
        end

      end

      class Mock

        def list_images()
          response = Excon::Response.new
          response.status = 200
          response.body = {"images"=>
             [{"name"=>"Red Hat Enterprise Linux 5.5 (32-bit) (TOR) (TOR)",
               "location"=>"101",
               "createdTime"=>1302178012203,
               "supportedInstanceTypes"=>
                [{"price"=>
                   {"pricePerQuantity"=>1,
                    "effectiveDate"=>-1,
                    "rate"=>0.31,
                    "countryCode"=>"897",
                    "unitOfMeasure"=>"UHR",
                    "currencyCode"=>"USD"},
                  "label"=>"Silver 32 bit",
                  "id"=>"SLV32.2/4096/60*350"},
                 {"price"=>
                   {"pricePerQuantity"=>1,
                    "effectiveDate"=>-1,
                    "rate"=>0.19,
                    "countryCode"=>"897",
                    "unitOfMeasure"=>"UHR",
                    "currencyCode"=>"USD"},
                  "label"=>"Copper 32 bit",
                  "id"=>"COP32.1/2048/60"}],
               "productCodes"=>["SBC_bfY4lszwRly4uhrERf4"],
               "id"=>"20018423",
               "documentation"=>
                "https://www-147.ibm.com/cloud/enterprise/ram.ws/RAMSecure/artifact/{55BE8A92-AD1F-DAF3-1FE0-6912EB47F154}/1.0/GettingStarted.html",
               "manifest"=>
                "https://www-147.ibm.com/cloud/enterprise/ram.ws/RAMSecure/artifact/{55BE8A92-AD1F-DAF3-1FE0-6912EB47F154}/1.0/parameters.xml",
               "description"=>"Red Hat Linux 5.5 32 bit - for TOR datacenter - TOR",
               "visibility"=>"PUBLIC",
               "platform"=>"Red Hat Enterprise Linux/5.5",
               "architecture"=>"i386",
               "owner"=>"SYSTEM",
               "state"=>1},]}
          response
        end

      end
    end
  end
end
