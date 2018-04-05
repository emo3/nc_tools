# Install the Netcool tool java
install_tool 'Java Gateway' do
  tool_pkg 'Im-nco-g-java-5_0.zip'
  tool_nam 'nco-g-java'
  tool_ver '1.5.0.0'
  tool_dir node['nc_tools']['install_dir']
  tool_ins "#{node['nc_tools']['install_dir']}/install.txt"
  tool_loc "#{node['nc_tools']['ob_dir']}/java/jars/nco_g_java.jar"
end
