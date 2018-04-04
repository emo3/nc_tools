# Create the dir's that are needed by netcool tool
directory node['nc_tools']['install_dir'] do
  user node['nc_tools']['nc_act']
  group node['nc_tools']['nc_grp']
  recursive true
  not_if { File.exist?(node['nc_tools']['tool_loc']) }
  mode '0755'
end

# Download the tool package file
remote_file "#{node['nc_tools']['install_dir']}/#{node['nc_tools']['package']}" do
  source "#{node['nc_tools']['media_url']}/#{node['nc_tools']['package']}"
  not_if { File.exist?("#{node['nc_tools']['install_dir']}/#{node['nc_tools']['package']}") }
  not_if { File.exist?(node['nc_tools']['tool_inst']) }
  not_if { File.exist?(node['nc_tools']['tool_loc']) }
  user node['nc_tools']['nc_act']
  group node['nc_tools']['nc_grp']
  mode '0755'
  action :create
end

# unzip the tool package file
execute 'unzip_package' do
  command "unzip -q #{node['nc_tools']['install_dir']}/#{node['nc_tools']['package']}"
  cwd node['nc_tools']['install_dir']
  not_if { File.exist?(node['nc_tools']['tool_inst']) }
  not_if { File.exist?(node['nc_tools']['tool_loc']) }
  user node['nc_tools']['nc_act']
  group node['nc_tools']['nc_grp']
  umask '022'
  action :run
end

template "#{node['nc_tools']['temp_dir']}/install_nc_tool.xml" do
  source 'install_nc_tool.xml.erb'
  not_if { File.exist?(node['nc_tools']['tool_loc']) }
  mode 0755
end

execute 'install_tool' do
  command "#{node['nc_tools']['app_dir']}/InstallationManager/eclipse/tools/imcl \
  input #{node['nc_tools']['temp_dir']}/install_nc_tool.xml \
  -log #{node['nc_tools']['temp_dir']}/install-nc_tool_log.xml \
  -acceptLicense"
  not_if { File.exist?(node['nc_tools']['tool_loc']) }
  user node['nc_tools']['nc_act']
  group node['nc_tools']['nc_grp']
  umask '022'
  action :run
end

file "#{node['nc_tools']['temp_dir']}/install_nc_tool.xml" do
  only_if { File.exist?(node['nc_tools']['tool_loc']) }
  action :delete
end

directory node['nc_tools']['install_dir'] do
  only_if { File.exist?(node['nc_tools']['tool_loc']) }
  recursive true
  action :delete
end
