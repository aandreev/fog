Shindo.tests('IBM::Compute | instance requests', ['ibm']) do

  @create_instance_format = {
    'instancesSet'  => [{
      'currentState' => {'code' => Integer, 'name' => String},
      'instanceId'    => String,
      'previousState' => {'code' => Integer, 'name' => String},
    }],
    'requestId'     => String
  }

  tests('success') do

    @instance_id = nil

    tests("#create_instance()").formats(@run_instances_format) do
      data = AWS[:compute].run_instances(GENTOO_AMI, 1, 1).body
      @instance_id = data['instancesSet'].first['instanceId']
      data
    end

    AWS[:compute].servers.get(@instance_id).wait_for { ready? }

    # The format changes depending on state of instance, so this would be brittle
    # tests("#describe_instances").formats(@describe_instances_format) do
    #   AWS[:compute].describe_instances.body
    # end

    tests("#describe_instances('instance-id' => '#{@instance_id}')").formats(@describe_instances_format) do
      AWS[:compute].describe_instances('instance-id' => @instance_id).body
    end

    tests("#get_console_output('#{@instance_id}')").formats(@get_console_output_format) do
      AWS[:compute].get_console_output(@instance_id).body
    end

    tests("#reboot_instances('#{@instance_id}')").formats(AWS::Compute::Formats::BASIC) do
      AWS[:compute].reboot_instances(@instance_id).body
    end

    tests("#terminate_instances('#{@instance_id}')").formats(@terminate_instances_format) do
      AWS[:compute].terminate_instances(@instance_id).body
    end

  end

  tests('failure') do

    tests("#get_console_output('i-00000000')").raises(Fog::AWS::Compute::NotFound) do
      AWS[:compute].get_console_output('i-00000000')
    end

    tests("#reboot_instances('i-00000000')").raises(Fog::AWS::Compute::NotFound) do
      AWS[:compute].reboot_instances('i-00000000')
    end

    tests("#terminate_instances('i-00000000')").raises(Fog::AWS::Compute::NotFound) do
      AWS[:compute].terminate_instances('i-00000000')
    end

  end

end
