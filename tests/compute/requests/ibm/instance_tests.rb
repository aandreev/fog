Shindo.tests('IBM::Compute | instance requests', ['ibm']) do

  @create_instance_format = {
    'name'          => String,
    'imageID'       => String,
    'instanceType'  => String,
    'location'      => String,
    'publicKey'     => String,
    #'ip'            => String,
    #'volumeID'      => String,
    #'vlanID'        => String,
    #'SecondaryIP'   => String,
    #'isMiniEphermal'          => Boolean,
    #'Configuration Data'      => { 'key' => 'value' },
    #'antiCollcationInstance'  => String
  }
  

  tests('success') do

    @name           = "fog test instance"
    @image_id       = "20018425"
    @instance_type  = "COP32.1/2048/60"
    @location       = "101"
    @public_key     = "test"
    @options        = {}

    tests("#create_instance('#{@name}', '#{@image_id}', '#{@instance_type}', '#{@location}', '#{@public_key}', #{@options})").formats(@create_instance_format) do
      data = IBM[:compute].create_instance(@name, @image_id, @instance_type, @location, @public_key, @options).body
      pp data
    end

  end

end
