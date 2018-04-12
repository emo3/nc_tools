require 'uri'

resource_name :install_tool

property :tool_pkg, String, default: ''
property :tool_nam, String, default: ''
property :tool_ver, String, default: ''
property :tool_dir, String, default: ''
property :tool_url, String, default: ''
property :tool_ins, String, default: ''
property :tool_loc, String, default: ''
property :nc_act,   String, default: 'netcool'
property :nc_grp,   String, default: 'ncoadmin'
property :temp_dir, String, default: '/tmp'

action :install do
  log "tool package   = #{tool_pkg}"
  log "tool name      = #{tool_nam}"
  log "tool version   = #{tool_ver}"
  log "tool directory = #{tool_dir}"
  log "tool url       = #{tool_url}"
  log "tool installed = #{tool_ins}"
  log "tool location  = #{tool_loc}"
  log "netcool accoun = #{nc_act}"
  log "netcool group  = #{nc_grp}"
  log "temp dir       = #{temp_dir}"

  uri = URI.parse("#{tool_url}/#{tool_pkg}")
  fname = ::File.basename(uri.path)
  fpath = ::File.join(tool_dir, fname)
  log "fname=#{fname}"
  log "fpath=#{fpath}"

  directory tool_dir do
    user nc_act
    group nc_grp
    recursive true
#    not_if { ::File.exist?(tool_loc) }
    mode '0755'
  end

  # Download the tool package file
  remote_file fpath do
    source "#{tool_url}/#{tool_pkg}"
    not_if { ::File.exist?(fpath) }
#    not_if { File.exist?(tool_ins) }
#    not_if { File.exist?(tool_loc) }
    user nc_act
    group nc_grp
    mode '0755'
    action :create
  end

  # unzip the tool package file
  execute 'unzip_package' do
    command "unzip -q #{tool_dir}/#{tool_pkg}"
    cwd tool_dir
    not_if { File.exist?(tool_ins) }
    not_if { File.exist?(tool_loc) }
    user nc_act
    group nc_grp
    umask '022'
    action :run
  end

  template "#{temp_dir}/install_nc_tool.xml" do
    source 'install_nc_tool.xml.erb'
    variables(
      tool_nam: tool_nam,
      tool_dir: tool_dir,
      tool_ver: tool_ver
    )
    not_if { File.exist?(tool_loc) }
    mode 0755
  end

  execute 'install_tool' do
    command "#{node['nc_tools']['app_dir']}/InstallationManager/eclipse/tools/imcl \
    input #{temp_dir}/install_nc_tool.xml \
    -log #{temp_dir}/install-nc_tool_log.xml \
    -acceptLicense"
    not_if { File.exist?(tool_loc) }
    user nc_act
    group nc_grp
    umask '022'
    action :run
  end

  file "#{temp_dir}/install_nc_tool.xml" do
    only_if { File.exist?(tool_loc) }
    action :delete
  end

  directory tool_dir do
    only_if { File.exist?(tool_loc) }
    recursive true
    action :delete
  end
end
