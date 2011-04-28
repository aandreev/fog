module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/get_image_manifest'

        # Returns manifest of image specified by id
        #
        # ==== Parameters
        # 'image_id'<~String>: id of desired image
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'manifest'<~String>: manifest of image in xml

        def get_image_manifest(image_id)
          request(
            :expects  => 200,
            :method   => 'GET',
            :path     => "computecloud/enterprise/api/rest/20100331/offerings/image/#{image_id}/manifest"
          )
        end

      end

      class Mock

        def get_image_manifest(image_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {"manifest"=>
              "<?xml version=\"1.0\" encoding=\"UTF-8\"?><parameters xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"platform:/resource/com.ibm.ccl.devcloud.client/schema/parameters.xsd\">\n\t<firewall>\n\t\t<rule>\n\t\t\t<source>0.0.0.0/0</source>\n\t\t\t<minport>1</minport>\n\t\t\t<maxport>65535</maxport>\n\t\t</rule>\n\t</firewall>\n</parameters>"}
          response
        end

      end
    end
  end
end
