# Override generic variables
node.default['nc_tools']['tool_name'] = 'nco-g-bmc-remedy'
node.default['nc_tools']['tool_dir']  = node['nc_tools']['install_dir']
node.default['nc_tools']['tool_ver']  = '1.3.0.3'
node.default['nc_tools']['package']   = 'Im-nco-g-bmc-remedy-3_0.zip'
node.default['nc_tools']['tool_inst'] = "#{node.default['nc_tools']['tool_dir']}/install.txt"
node.default['nc_tools']['tool_loc']  = "#{node['nc_tools']['ob_dir']}/gates/bmc_remedy/default/bmc_remedy.map"
execute 'running_remedy' do
  command "echo #{node['nc_tools']['tool_loc']} #{node['nc_tools']['tool_name']} "
end
# Install Base Netcool
include_recipe 'nc_base::make_nc_base'
# Install the Netcool tool
include_recipe '::install_nc_tool'
