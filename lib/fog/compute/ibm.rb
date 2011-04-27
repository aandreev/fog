module Fog
  module IBM
    class Compute < Fog::Service

      requires :ibm_user_id, :ibm_password
      recognizes :ibm_host, :ibm_port, :ibm_scheme, :persistent
      recognizes :provider # remove post deprecation

      model_path 'fog/compute/models/ibm'
      model       :server
      collection  :servers

      request_path 'fog/compute/requests/ibm'
      request :create_instance
      request :delete_instance
      request :get_instance
      request :list_instances
      request :list_images
      request :list_storage

      class Mock

        def self.data
          @data ||= Hash.new do |hash, key|
            hash[key] = {}
          end
        end

        def initialize(options={})
          unless options.delete(:provider)
            location = caller.first
            warning = "[yellow][WARN] Fog::IBM::Compute.new is deprecated, use Fog::Compute.new(:provider => 'IBM') instead[/]"
            warning << " [light_black](" << location << ")[/] "
            Formatador.display_line(warning)
          end
          
          @ibm_user_id  = options[:ibm_user_id]
          @ibm_password = options[:ibm_password]
          @data = self.class.data[@ibm_user_id]
        end

        def reset_data
          self.class.data.delete(@ibm_user_id)
          @data = self.class.data[@ibm_user_id]
        end

      end

      class Real

        def initialize(options={})
          unless options.delete(:provider)
            location = caller.first
            warning = "[yellow][WARN] Fog::IBM::Compute.new is deprecated, use Fog::Compute.new(:provider => 'IBM') instead[/]"
            warning << " [light_black](" << location << ")[/] "
            Formatador.display_line(warning)
          end

          require 'json'
          @ibm_user_id  = options[:ibm_user_id]
          @ibm_password = options[:ibm_password]
          @host   = options[:ibm_host]    || "www-147.ibm.com"
          @port   = options[:ibm_port]    || 443
          @scheme = options[:ibm_scheme]  || 'https'
          @connection = Fog::Connection.new("#{@scheme}://#{@host}:#{@port}", options[:persistent])
        end

        def reload
          @connection.reset
        end

        def request(params)
          params[:headers] ||= {}
          params[:headers].merge!({
            'Accept' => 'application/json',
            'Authorization' => "Basic #{Base64.encode64([@ibm_user_id, @ibm_password].join(':')).chomp}"
          })

          begin
            response = @connection.request(params.merge!({:host => @host}))
          rescue Excon::Errors::HTTPStatusError => error
            raise case error
            when Excon::Errors::NotFound
              Fog::IBM::Compute::NotFound.slurp(error)
            else
              error
            end
          end
          unless response.body.empty?
            response.body = JSON.parse(response.body)
          end
          response
        end

      end
    end
  end
end
