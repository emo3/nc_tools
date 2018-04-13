# Install the Netcool tools defined in 'install' array
%w(nco-g-jdbc nco-g-bmc-remedy nco-p-mttrapd nco-p-tivoli-eif).each do |tool|
  install_tool 'install tool' do
    tool_pkg node['nc_tools'][tool]['tool_pkg']
    tool_url node['nc_tools'][tool]['tool_url']
    tool_dir node['nc_tools'][tool]['tool_dir']
    tool_loc node['nc_tools'][tool]['tool_loc']
    tool_ver node['nc_tools'][tool]['tool_ver']
    tool_nam node['nc_tools'][tool]['tool_nam']
    tool_imd node['nc_tools'][tool]['tool_imd']
    action :install
  end
end
