require 'fog/core/model'

module Fog
  module IBM
    class Compute

      class BlockInstantiationError < StandardError; end

      class Server < Fog::Model

        identity :id

        attribute :name
        attribute :location
        attribute :key_name
        # TODO: put the other attributes in here

        def initialize(attributes={})
          super
        end

        def destroy
          requires :id
          # TODO: Implement delete_instance
          connection.delete_instance(id)
          true
        end

        def public_ip_address
          ips.first
        end

        def ready?
          # TODO: Implement this
          true
        end

        def reboot(type = 'SOFT')
          requires :id
          #connection.reboot_block(id, type)
          true
        end

        def save
          raise Fog::Errors::Error.new('Resaving an existing object may create a duplicate') if identity
          #requires :flavor_id, :image_id
          options = {}
          #data = connection.create_instance()
          #merge_attributes(data.body)
          true
        end

        def setup(credentials = {})
          requires :identity, :ips, :public_key, :username
          Fog::SSH.new(ips.first['address'], username, credentials).run([
            %{mkdir .ssh},
            %{echo "#{public_key}" >> ~/.ssh/authorized_keys},
            %{passwd -l #{username}},
            %{echo "#{attributes.to_json}" >> ~/attributes.json}
          ])
        rescue Errno::ECONNREFUSED
          sleep(1)
          retry
        end

        def ssh(commands)
          requires :identity, :ips, :username

          options = {}
          options[:key_data] = [private_key] if private_key
          Fog::SSH.new(ips.first['address'], username, options).run(commands)
        end

        def scp(local_path, remote_path)
          requires :ips, :username

          options = {}
          options[:key_data] = [private_key] if private_key
          Fog::SCP.new(ips.first['address'], username, options).upload(local_path, remote_path)
        end

        def username
          @username ||= 'deploy'
        end

      end

    end
  end
end
