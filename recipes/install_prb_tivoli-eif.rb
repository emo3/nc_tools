# Install the Netcool tool EIF (Event Integration Facility)
install_tool 'Tivoli EIF Probe' do
  tool_pkg 'CN1FVEN.zip'
  tool_nam 'nco-p-tivoli-eif'
  tool_ver '1.13.0.7'
  tool_dir node['nc_tools']['install_dir']
  tool_ins "#{node['nc_tools']['install_dir']}/install.txt"
  tool_loc "#{node['nc_tools']['ob_dir']}/probes/linux2x86/default/tivoli_eif.rules"
end
