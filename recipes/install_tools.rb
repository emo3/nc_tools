# Install the Netcool tools defined in 'install' array
%w(nco-g-jdbc nco-g-bmc-remedy nco-p-mttrapd nco-p-tivoli-eif).each do |tool|
  install_tool node['nc_tools'][tool]['tool_nam'] do
    tool_nam node['nc_tools'][tool]['tool_nam']
    tool_pkg node['nc_tools'][tool]['tool_pkg']
    tool_ver node['nc_tools'][tool]['tool_ver']
    tool_dir node['nc_tools'][tool]['tool_dir']
    tool_ins node['nc_tools'][tool]['tool_ins']
    tool_loc node['nc_tools'][tool]['tool_loc']
    action :install
  end
end
