module Fog
  module IBM
    class Compute
      class Real

        #require 'fog/compute/parsers/ibm/create_storage'

        # Requests a new Instance to be created.
        #
        # ==== Parameters
        # * name<~String> - The alias to use to referance storage volume 
        # * format<~String> - filesystem format for storage 
        # * location<~String> - datacenter location for storage 
        # * size<~String> - size of storage desired (Small, Medium, Large) (varies by location what size actually is)
        # * offeringID<~String> - offering id can be requested from /computecloud/enterprise/api/rest/20100331/offerings/storage
        # * storageAreaID<~String> - (not supported yet)
        #
        # === Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        # * name<~String> - The alias to use to referance storage volume 
        # * format<~String> - filesystem format for storage 
        # * location<~String> - datacenter location for storage 
        # * createdTime<~Integer> - Epoch time of creation
        # * size<~String> - size of storage desired (Small, Medium, Large) (varies by location what size actually is)
        # * productCodes<~Array> - 
        # * offeringID<~String> - offering id can be requested from /computecloud/enterprise/api/rest/20100331/offerings/storage
        # * id<~String> - id of new storage
        # * owner<~String> - owner of new storage
        # * state<~Integer> - state of newly requested storage
        
        
        def create_storage(name, format, location, size, offering_id)
          request(
            :expects  => 200,
            :method   => 'POST',
            :path     => "computecloud/enterprise/api/rest/20100331/storage",
            :headers  => { 'Content-Type' => "application/x-www-form-urlencoded" },
            :query    => {
              'name'          => name,
              'format'        => format,
              'location'      => location,
              'size'          => size,
              'offeringID'    => offering_id
            }
          )
        end

      end

      class Mock

        def create_storage(name, format, location, size, offering_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {"name"=>"test",
           "format"=>"ext3",
           "location"=>"101",
           "createdTime"=>1303865277761,
           "size"=>"256",
           "productCodes"=>[],
           "offeringId"=>"20001208",
           "id"=>"9231",
           "owner"=>"user@example.com",
           "state"=>0}
          response
        end

      end
    end
  end
end
