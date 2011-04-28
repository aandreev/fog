module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/delete_image'

        # Deletes the image that the authenticated user manages with the specified :image_id
        #
        # ==== Parameters
        # * image_id<~String> - Id of image
        # 
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     *'success'<~Bool>: true or false for success
        
        def delete_image(image_id)
          request(
            :expects  => 200,
            :method   => 'DELETE',
            :path     => "computecloud/enterprise/api/rest/20100331/offerings/image/#{image_id}"
          )
        end

      end

      class Mock

        def delete_image(image_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {"success"=>true}
          response
        end

      end
    end
  end
end
