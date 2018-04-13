require 'uri'

resource_name :install_tool

property :tool_pkg, String, default: ''
property :tool_url, String, default: ''
property :tool_dir, String, default: ''
property :tool_loc, String, default: ''
property :tool_ver, String, default: ''
property :tool_nam, String, default: ''
property :tool_imd, String, default: ''
property :nc_act,   String, default: 'netcool'
property :nc_grp,   String, default: 'ncoadmin'
property :temp_dir, String, default: '/tmp'

action :install do
  log "tool package   = #{new_resource.tool_pkg}"
  log "tool url       = #{new_resource.tool_url}"
  log "tool dir       = #{new_resource.tool_dir}"
  log "tool location  = #{new_resource.tool_loc}"
  log "tool version   = #{new_resource.tool_ver}"
  log "tool name      = #{new_resource.tool_nam}"
  log "Instal Man Dir = #{new_resource.tool_imd}"
  log "netcool accoun = #{new_resource.nc_act}"
  log "netcool group  = #{new_resource.nc_grp}"
  log "temp dir       = #{new_resource.temp_dir}"

  uri = URI.parse("#{new_resource.tool_url}/#{new_resource.tool_pkg}")
  fname = ::File.basename(uri.path)
  fpath = ::File.join(new_resource.tool_dir, fname)
  log "fname=#{fname}"
  log "fpath=#{fpath}"

  directory new_resource.tool_dir do
    user new_resource.nc_act
    group new_resource.nc_grp
    recursive true
    not_if { ::File.exist?(fpath) }
    not_if { ::File.exist?(new_resource.tool_loc) }
    mode '0755'
  end

  # Download the tool package file
  remote_file fpath do
    source "#{new_resource.tool_url}/#{new_resource.tool_pkg}"
    not_if { ::File.exist?(fpath) }
    not_if { ::File.exist?("#{new_resource.tool_dir}/#{fname}") }
    not_if { ::File.exist?(new_resource.tool_loc) }
    user new_resource.nc_act
    group new_resource.nc_grp
    mode '0755'
    action :create
  end

  # unzip the tool package file
  execute 'unzip_package' do
    command "unzip -q #{new_resource.tool_dir}/#{new_resource.tool_pkg}"
    cwd new_resource.tool_dir
    not_if { ::File.exist?("#{new_resource.tool_dir}/repository.xml") }
    not_if { ::File.exist?(new_resource.tool_loc) }
    user new_resource.nc_act
    group new_resource.nc_grp
    umask '022'
    action :run
  end

  template "#{new_resource.temp_dir}/install_nc_tool.xml" do
    source 'install_nc_tool.xml.erb'
    variables(
      tool_nam: new_resource.tool_nam,
      tool_dir: new_resource.tool_dir,
      tool_ver: new_resource.tool_ver
    )
    not_if { ::File.exist?(new_resource.tool_loc) }
    mode 0755
  end

  execute 'install_tool_w-InstallationManager' do
    command "#{new_resource.tool_imd}/InstallationManager/eclipse/tools/imcl \
    input #{new_resource.temp_dir}/install_nc_tool.xml \
    -log #{new_resource.temp_dir}/install-nc_tool_log.xml \
    -acceptLicense"
    not_if { ::File.exist?(new_resource.tool_loc) }
    user new_resource.nc_act
    group new_resource.nc_grp
    umask '022'
    action :run
  end

  file "#{new_resource.temp_dir}/install_nc_tool.xml" do
    only_if { ::File.exist?(new_resource.tool_loc) }
    action :delete
  end

  directory new_resource.tool_dir do
    only_if { ::File.exist?(new_resource.tool_loc) }
    recursive true
    action :delete
  end
end
