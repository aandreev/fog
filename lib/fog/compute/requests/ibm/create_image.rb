module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/create_image'

        # Requests an image to be created from an Instance
        #
        # ==== Parameters
        # * instance_id<~String> - id of instance to save
        # * name<~String> - name of image to be created 
        # * description<~String> - description of image to be created 
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'name'<~String>: name of new image
        #     * 'createdTime'<~Integer>: epoch time at creation
        #     * 'productCodes'<~Array>: 
        #     * 'id'<~String>: id of new image
        #     * 'description'<~String>: description
        #     * 'visibility'<~String>: visibility level ("PRIVATE", etc)
        #     * 'state'<~Integer>: status of image
                
        def create_image(instance_id, name, description)
          request(
            :expects  => 200,
            :method   => 'PUT',
            :path     => "computecloud/enterprise/api/rest/20100331/instances/#{instance_id}",
            :body    => {
              'state'       => 'save',
              'name'        => name,
              'description' => description
            }
          )
        end

      end

      class Mock

        def create_image(instance_id, name, description)
          response = Excon::Response.new
          response.status = 200
          response.body = {"name"=>"test",
             "createdTime"=>1303956610859,
             "productCodes"=>[],
             "id"=>"20020459",
             "description"=>"Another test image",
             "visibility"=>"PRIVATE",
             "state"=>0}
          response
        end

      end
    end
  end
end
