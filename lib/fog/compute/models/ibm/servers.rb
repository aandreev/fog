require 'fog/core/collection'
require 'fog/compute/models/ibm/server'

module Fog
  module IBM
    class Compute

      class Servers < Fog::Collection

        model Fog::IBM::Compute::Server

        def all
          data = connection.get_servers.body
          load(data)
        end

        def get(instance_id)
          if instance_id && server = connection.get_instance(instance_id).body
            new(server)
          end
        rescue Fog::IBM::Compute::NotFound
          nil
        end

      end

    end
  end
end
