# Install the Netcool tool jdbc
install_tool 'JDBC Gateway' do
  tool_pkg 'CN4FUEN.zip'
  tool_nam 'nco-g-jdbc'
  tool_ver '1.6.0.4'
  tool_dir node['nc_tools']['install_dir']
  tool_ins "#{node['nc_tools']['install_dir']}/install.txt"
  tool_loc "#{node['nc_tools']['ob_dir']}/gates/jdbc/default/jdbc.map"
end
