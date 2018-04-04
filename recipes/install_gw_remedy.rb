# Override generic variables
node.default['nc_tools']['tool_name'] = 'nco-g-bmc-remedy'
node.default['nc_tools']['tool_dir']  = 'Im-nco-g-bmc-remedy-3_0'
node.default['nc_tools']['tool_ver']  = '1.3.0.3'
node.default['nc_tools']['package']   = 'Im-nco-g-bmc-remedy-3_0.zip'
node.default['nc_tools']['tool_inst'] = 'Im-nco-g-bmc-remedy-3_0.zip'
node.default['nc_tools']['tool_loc']  = "#{node['objsrv']['ob_dir']}/gates/bmc_remedy/default/bmc_remedy.map"
# Install the Netcool tool
include_recipe '::install_nc_tool'
