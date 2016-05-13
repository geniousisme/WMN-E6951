defProperty('prefix', "omf.witest.", "Prefix for node names")

# Edit this array to list the nodes that your experiment will run on
nodes = ["node7", "node2", "node3", "node4"]

# Code to set up configuration and apps to run on each node
nodes.each do |n|  
  defGroup("#{n}", "#{property.prefix}#{n}") do |node|
    # Connect to WiMAX network with network ID 51
    node.net.x0.profile = '51'
    # Run application to query and report MCS, with the following arguments
    # Details of this application are in the "application wrapper" at
    # /usr/share/omf-expctl-5.3/repository/test/app/mcs_app.rb    
    node.addApplication("test:app:mcs_app") do |app|
      app.setProperty('times', 15)
      app.setProperty('url',"http://10.0.0.200:5053/result/queryDatabase")
      app.measure('dl')
      app.measure('ul')
    end
  end
end       

# Start experiment when all nodes are online
onEvent(:ALL_UP_AND_INSTALLED) do |event|  
  wait 10
  # Start all the applications on all nodes
  allGroups.startApplications
  wait 60
  # Stop all the applications on all nodes
  allGroups.stopApplications
  Experiment.done
end  
