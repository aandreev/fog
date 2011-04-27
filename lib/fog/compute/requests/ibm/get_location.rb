module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/get_location'

        # Used to retrieve the specified storage volume for specified storage_id
        #
        # ==== Parameters
        # * location_id<~String> - Id of locatio
        # 
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'name'<~String>: location name
        #     * 'location'<~String>: 
        #     * 'capabilities'<~Array>: 
        #       * 'oss.storage.format'<~Hash>:
        #         * 'entries'<~Array>: list of supported volume formats
        #         * 'oss.instance.spec.i386'<~Array>: unsure.. returns empty array
        #         * 'oss.instance.spec.x86_64'<~Array>: unsure.. returns empty array
        #         * 'oss.storage.availabilityarea'<~Array>: availability area unsupported
        #     * 'id'<~String>: id of location
        #     * 'description'<~String>: description including geographic location
        #     * 'state'<~String>: state of datacenter

        def get_location(location_id)
          request(
            :expects  => 200,
            :method   => 'GET',
            :path     => "computecloud/enterprise/api/rest/20100331/locations/#{location_id}"
          )
        end

      end

      class Mock

        def get_location(location_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {"name"=>"ca-on-dc1",
            "location"=>"ca-on-dc1",
            "capabilities"=>
             [{"id"=>"oss.storage.format",
               "entries"=>{"RAW"=>["raw"], "EXT3"=>["ext3"]}},
              {"id"=>"oss.instance.spec.i386", "entries"=>{}},
              {"id"=>"oss.instance.spec.x86_64", "entries"=>{}},
              {"id"=>"oss.storage.availabilityarea", "entries"=>{}}],
            "id"=>"101",
            "description"=>"Data Center 1 at Ontario, Canada ",
            "state"=>1}
          response
        end

      end
    end
  end
end
