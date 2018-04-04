# Install the Netcool tool bmc_remedy
install_tool 'Remedy' do
  tool_pkg 'Im-nco-g-bmc-remedy-3_0.zip'
  tool_nam 'nco-g-bmc-remedy'
  tool_ver '1.3.0.3'
  tool_dir node['nc_tools']['install_dir']
  tool_ins "#{node.default['nc_tools']['tool_dir']}/install.txt"
  tool_loc "#{node['nc_tools']['ob_dir']}/gates/bmc_remedy/default/bmc_remedy.map"
end
