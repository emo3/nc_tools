# Override generic variables
node.default['nc_tools']['tool_name'] = 'nco-g-jdbc'
node.default['nc_tools']['tool_dir']  = node['nc_tools']['install_dir']
node.default['nc_tools']['tool_ver']  = '1.6.0.4'
node.default['nc_tools']['package']   = 'CN4FUEN.zip'
node.default['nc_tools']['tool_inst'] = "#{node['nc_tools']['tool_dir']}/install.txt"
node.default['nc_tools']['tool_loc']  = "#{node['nc_tools']['ob_dir']}/gates/jdbc/default/jdbc.map"
# Install Base Netcool
include_recipe 'nc_base::make_nc_base'
# Install the Netcool tool
include_recipe '::install_nc_tool'
