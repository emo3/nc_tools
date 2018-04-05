# Install the Netcool tool jdbc reporting scripts
install_tool 'JDBC Reporting Scripts Gateway' do
  tool_pkg 'CN1FLEN.zip'
  tool_nam 'nco-g-jdbc-reporting-scripts'
  tool_ver '1.1.0.2'
  tool_dir node['nc_tools']['install_dir']
  tool_ins "#{node['nc_tools']['install_dir']}/install.txt"
  tool_loc "#{node['nc_tools']['ob_dir']}/gates/reporting/db2/default/db2.reporting.sql"
end
