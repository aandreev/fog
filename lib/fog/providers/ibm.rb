require 'fog/core'

module Fog
  module IBM

    extend Fog::Provider

    service(:compute, 'compute/ibm')

  end
end
