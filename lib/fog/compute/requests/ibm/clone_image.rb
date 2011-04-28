module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/clone_image'

        # Clones image specified by image_id
        #
        # ==== Parameters
        # * image_id<~String> - id of image to be cloned
        # * name<~String> - name of new image
        # * description<~String> - description of new image
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'ImageID'<~String>: id of new image
        
        def clone_image(image_id, name, description)
          request(
            :expects  => 200,
            :method   => 'POST',
            :path     => "computecloud/enterprise/api/rest/20100331/offerings/image/#{image_id}",
            :headers  => { 'Content-Type' => "application/x-www-form-urlencoded" },
            :body     => {
              'name'          => name,
              'description'   => description
            }
          )
        end

      end

      class Mock

        def clone_image(location, offering_id, vlan_id="")
          response = Excon::Response.new
          response.status = 200
          response.body = {"ImageID"=>"20020600"}
          response
        end

      end
    end
  end
end
