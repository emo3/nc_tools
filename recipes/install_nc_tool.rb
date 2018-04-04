# Create the dir's that are needed by netcool
directory node['nc_tools']['install_dir'] do
  user node['nc_tools']['nc_act']
  group node['nc_tools']['nc_grp']
  not_if { File.exist?("#{node['nc_tools']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  recursive true
  mode '0755'
end

# Download the probes package file
remote_file "#{node['nc_tools']['install_dir']}/#{node['nc_tools']['package']}" do
  source "#{node['nc_tools']['media_url']}/#{node['nc_tools']['package']}"
  not_if { File.exist?("#{node['nc_tools']['install_dir']}/#{node['nc_tools']['package']}") }
  not_if { File.exist?("#{node['nc_tools']['install_dir']}/nco-p-mttrapd_20_0/install.txt") }
  not_if { File.exist?("#{node['nc_tools']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  user node['nc_tools']['nc_act']
  group node['nc_tools']['nc_grp']
  mode '0755'
  action :create
end

# unzip the probes package file
execute 'unzip_package' do
  command "unzip -q #{node['nc_tools']['install_dir']}/#{node['nc_tools']['package']}"
  cwd node['nc_tools']['install_dir']
  not_if { File.exist?("#{node['nc_tools']['install_dir']}/nco-p-mttrapd_20_0/install.txt") }
  not_if { File.exist?("#{node['nc_tools']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  user node['nc_tools']['nc_act']
  group node['nc_tools']['nc_grp']
  umask '022'
  action :run
end

template "#{node['nc_tools']['temp_dir']}/install_product-probes81.xml" do
  not_if { File.exist?("#{node['nc_tools']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  source 'install_product-probes81.xml.erb'
  mode 0755
end

execute 'install_probes' do
  command "#{node['nc_tools']['app_dir']}/InstallationManager/eclipse/tools/imcl \
  input #{node['nc_tools']['temp_dir']}/install_product-probes81.xml \
  -log #{node['nc_tools']['temp_dir']}/install-probes_log.xml \
  -acceptLicense"
  not_if { File.exist?("#{node['nc_tools']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  user node['nc_tools']['nc_act']
  group node['nc_tools']['nc_grp']
  umask '022'
  action :run
end

file "#{node['nc_tools']['temp_dir']}/install_product-probes81.xml" do
  only_if { File.exist?("#{node['nc_tools']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  action :delete
end

directory node['nc_tools']['install_dir'] do
  only_if { File.exist?("#{node['nc_tools']['nc_dir']}/omnibus/probes/linux2x86/nco_p_mttrapd") }
  recursive true
  action :delete
end
