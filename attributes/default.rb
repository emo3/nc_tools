default['nc_tools']['cots_dir']    = '/cots'
default['nc_tools']['app_dir']     = "#{node['nc_tools']['cots_dir']}/apps"
default['nc_tools']['nc_dir']      = "#{node['nc_tools']['app_dir']}/netcool"
default['nc_tools']['ob_dir']      = "#{node['nc_tools']['nc_dir']}/omnibus"
default['nc_tools']['install_dir'] = "#{node['nc_tools']['app_dir']}/media"
default['nc_tools']['temp_dir']    = '/tmp'
default['nc_tools']['media_url']   = 'http://10.1.1.30/media'
default['nc_tools']['nc_act']      = 'netcool'
default['nc_tools']['nc_grp']      = 'ncoadmin'
default['nc_tools'] = {
  'nco-g-java' => {
    'tool_name' => 'nco-g-java',
    'tool_package' => 'Im-nco-g-java-5_0.zip',
    'tool_version' => '1.5.0.0',
    'tool_dir' => node['nc_tools']['install_dir'],
    'tool_url' => node['nc_tools']['media_url'],
    'tool_lif' => "#{node['nc_tools']['ob_dir']}/java/jars/nco_g_java.jar",
    'tool_imd' => node['nc_tools']['app_dir'],
    'tool_ncd' => node['nc_tools']['nc_dir'],
  },
  'nco-g-jdbc' => {
    'tool_name' => 'nco-g-jdbc',
    'tool_package' => 'CN4FUEN.zip',
    'tool_version' => '1.6.0.4',
    'tool_dir' => node['nc_tools']['install_dir'],
    'tool_url' => node['nc_tools']['media_url'],
    'tool_lif' => "#{node['nc_tools']['ob_dir']}/gates/jdbc/default/jdbc.map",
    'tool_imd' => node['nc_tools']['app_dir'],
    'tool_ncd' => node['nc_tools']['nc_dir'],
  },
  'nco-g-jdbc-reporting-scripts' => {
    'tool_name' => 'nco-g-jdbc-reporting-scripts',
    'tool_package' => 'CN1FLEN.zip',
    'tool_version' => '1.1.0.2',
    'tool_dir' => node['nc_tools']['install_dir'],
    'tool_url' => node['nc_tools']['media_url'],
    'tool_lif' => "#{node['nc_tools']['ob_dir']}/gates/reporting/db2/default/db2.reporting.sql",
    'tool_imd' => node['nc_tools']['app_dir'],
    'tool_ncd' => node['nc_tools']['nc_dir'],
  },
  'nco-g-bmc-remedy' => {
    'tool_name' => 'nco-g-bmc-remedy',
    'tool_package' => 'Im-nco-g-bmc-remedy-3_0.zip',
    'tool_version' => '1.3.0.3',
    'tool_dir' => node['nc_tools']['install_dir'],
    'tool_url' => node['nc_tools']['media_url'],
    'tool_lif' => "#{node['nc_tools']['ob_dir']}/gates/bmc_remedy/default/bmc_remedy.map",
    'tool_imd' => node['nc_tools']['app_dir'],
    'tool_ncd' => node['nc_tools']['nc_dir'],
  },
  'nco-p-mttrapd' => {
    'tool_name' => 'nco-p-mttrapd',
    'tool_package' => 'CN4FZEN.zip',
    'tool_version' => '1.20.0.2',
    'tool_dir' => node['nc_tools']['install_dir'],
    'tool_url' => node['nc_tools']['media_url'],
    'tool_lif' => "#{node['nc_tools']['ob_dir']}/probes/linux2x86/default/mttrapd.rules",
    'tool_imd' => node['nc_tools']['app_dir'],
    'tool_ncd' => node['nc_tools']['nc_dir'],
  },
  'nco-p-tivoli-eif' => {
    'tool_name' => 'nco-p-tivoli-eif',
    'tool_package' => 'CN1FVEN.zip',
    'tool_version' => '1.13.0.7',
    'tool_dir' => node['nc_tools']['install_dir'],
    'tool_url' => node['nc_tools']['media_url'],
    'tool_lif' => "#{node['nc_tools']['ob_dir']}/probes/linux2x86/default/tivoli_eif.rules",
    'tool_imd' => node['nc_tools']['app_dir'],
    'tool_ncd' => node['nc_tools']['nc_dir'],
  },
  'nco-p-stdin' => {
    'tool_name' => 'nco-p-stdin',
    'tool_package' => 'CN1H4EN.zip',
    'tool_version' => '1.4.0.5113',
    'tool_dir' => node['nc_tools']['install_dir'],
    'tool_url' => node['nc_tools']['media_url'],
    'tool_lif' => "#{node['nc_tools']['ob_dir']}/probes/linux2x86/default/stdin.rules",
    'tool_imd' => node['nc_tools']['app_dir'],
    'tool_ncd' => node['nc_tools']['nc_dir'],
  },
}
