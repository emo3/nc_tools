# Install the Netcool tool mttrapd
install_tool 'Mttrapd' do
  tool_pkg 'CN4FZEN.zip'
  tool_nam 'nco-p-mttrapd'
  tool_ver '1.20.0.2'
  tool_dir node['nc_tools']['install_dir']
  tool_ins "#{node['nc_tools']['install_dir']}/install.txt"
  tool_loc "#{node['nc_tools']['ob_dir']}/gates/bmc_remedy/default/bmc_remedy.map"
end
