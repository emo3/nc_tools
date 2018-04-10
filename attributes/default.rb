default['nc_tools']['cots_dir']    = '/sfcots'
default['nc_tools']['app_dir']     = "#{node['nc_tools']['cots_dir']}/apps"
default['nc_tools']['nc_dir']      = "#{node['nc_tools']['app_dir']}/netcool"
default['nc_tools']['ob_dir']      = "#{node['nc_tools']['nc_dir']}/omnibus"
default['nc_tools']['install_dir'] = "#{node['nc_tools']['app_dir']}/media"
default['nc_tools']['temp_dir']    = '/tmp'
default['nc_tools']['media_url']   = 'http://10.1.1.30/media'
default['nc_tools']['nc_act']      = 'netcool'
default['nc_tools']['nc_grp']      = 'ncoadmin'
default['nc_tools']['remedy']      = 'P_REMEDY_GATE'
default['nc_tools']['rdy_dir']     = "#{node['nc_tools']['ob_dir']}/etc/#{node['nc_tools']['remedy']}"
default['nc_tools']['install']     = ['nco-g-jdbc', 'nco-g-bmc-remedy', 'nco-p-mttrapd', 'nco-p-tivoli-eif']
default['nc_tools'] = {
  'nco-g-java' => {
    'tool_nam' => 'nco-g-java',
    'tool_pkg' => 'Im-nco-g-java-5_0.zip',
    'tool_ver' => '1.5.0.0',
    'tool_dir' => node['nc_tools']['install_dir'],
    'tool_ins' => "#{node['nc_tools']['install_dir']}/repository.xml",
    'tool_loc' => "#{node['nc_tools']['ob_dir']}/java/jars/nco_g_java.jar",
  },
  'nco-g-jdbc' => {
    'tool_nam' => 'nco-g-jdbc',
    'tool_pkg' => 'CN4FUEN.zip',
    'tool_ver' => '1.6.0.4',
    'tool_dir' => node['nc_tools']['install_dir'],
    'tool_ins' => "#{node['nc_tools']['install_dir']}/repository.xml",
    'tool_loc' => "#{node['nc_tools']['ob_dir']}/gates/jdbc/default/jdbc.map",
  },
  'nco-g-jdbc-reporting-scripts' => {
    'tool_nam' => 'nco-g-jdbc-reporting-scripts',
    'tool_pkg' => 'CN1FLEN.zip',
    'tool_ver' => '1.1.0.2',
    'tool_dir' => node['nc_tools']['install_dir'],
    'tool_ins' => "#{node['nc_tools']['install_dir']}/repository.xml",
    'tool_loc' => "#{node['nc_tools']['ob_dir']}/gates/reporting/db2/default/db2.reporting.sql",
  },
  'nco-g-bmc-remedy' => {
    'tool_nam' => 'nco-g-bmc-remedy',
    'tool_pkg' => 'Im-nco-g-bmc-remedy-3_0.zip',
    'tool_ver' => '1.3.0.3',
    'tool_dir' => node['nc_tools']['install_dir'],
    'tool_ins' => "#{node['nc_tools']['install_dir']}/repository.xml",
    'tool_loc' => "#{node['nc_tools']['ob_dir']}/gates/bmc_remedy/default/bmc_remedy.map",
  },
  'nco-p-mttrapd' => {
    'tool_nam' => 'nco-p-mttrapd',
    'tool_pkg' => 'CN4FZEN.zip',
    'tool_ver' => '1.20.0.2',
    'tool_dir' => node['nc_tools']['install_dir'],
    'tool_ins' => "#{node['nc_tools']['install_dir']}/repository.xml",
    'tool_loc' => "#{node['nc_tools']['ob_dir']}/probes/linux2x86/default/mttrapd.rules",
  },
  'nco-p-tivoli-eif' => {
    'tool_nam' => 'nco-p-tivoli-eif',
    'tool_pkg' => 'CN1FVEN.zip',
    'tool_ver' => '1.13.0.7',
    'tool_dir' => node['nc_tools']['install_dir'],
    'tool_ins' => "#{node['nc_tools']['install_dir']}/repository.xml",
    'tool_loc' => "#{node['nc_tools']['ob_dir']}/probes/linux2x86/default/tivoli_eif.rules",
  },
}
