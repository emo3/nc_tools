require 'uri'

resource_name :install_tool

property :tool_package, String, default: ''
property :tool_url, String, default: ''
property :tool_dir, String, default: ''
property :tool_lif, String, default: ''
property :tool_version, String, default: ''
property :tool_name, String, default: ''
property :tool_imd, String, default: ''
property :tool_ncd, String, default: ''
property :nc_act, String, default: 'netcool'
property :nc_grp, String, default: 'ncoadmin'
property :temp_dir, String, default: '/tmp'

action :install do
  # log "tool package = #{new_resource.tool_package}"
  # log "tool url = #{new_resource.tool_url}"
  # log "tool dir = #{new_resource.tool_dir}"
  # log "tool location installed file = #{new_resource.tool_lif}"
  # log "tool version = #{new_resource.tool_version}"
  # log "tool name = #{new_resource.tool_name}"
  # log "tool ncd = #{new_resource.tool_ncd}"
  # log "Installation Manager Dir = #{new_resource.tool_imd}"
  # log "netcool account = #{new_resource.nc_act}"
  # log "netcool group = #{new_resource.nc_grp}"
  # log "temp dir = #{new_resource.temp_dir}"

  uri = URI.parse("#{new_resource.tool_url}/#{new_resource.tool_package}")
  fname = ::File.basename(uri.path)
  fpath = ::File.join(new_resource.tool_dir, fname)
  log "fname=#{fname}"
  log "fpath=#{fpath}"

  directory new_resource.tool_dir do
    user new_resource.nc_act
    group new_resource.nc_grp
    recursive true
    not_if { ::File.exist?(fpath) }
    not_if { ::File.exist?(new_resource.tool_lif) }
    mode '0755'
  end

  # Download the tool package file
  remote_file fpath do
    source "#{new_resource.tool_url}/#{new_resource.tool_package}"
    not_if { ::File.exist?(fpath) }
    not_if { ::File.exist?("#{new_resource.tool_dir}/#{fname}") }
    not_if { ::File.exist?(new_resource.tool_lif) }
    user new_resource.nc_act
    group new_resource.nc_grp
    mode '0755'
    action :create
  end

  # unzip the tool package file
  execute 'unzip_package' do
    command "unzip -q #{new_resource.tool_dir}/#{new_resource.tool_package}"
    cwd new_resource.tool_dir
    not_if { ::File.exist?("#{new_resource.tool_dir}/repository.xml") }
    not_if { ::File.exist?(new_resource.tool_lif) }
    user new_resource.nc_act
    group new_resource.nc_grp
    umask '022'
    action :run
  end

  template "#{new_resource.temp_dir}/install_nc_tool.xml" do
    source 'install_nc_tool.xml.erb'
    cookbook 'nc_tools'
    variables(
      imd_dir:  new_resource.tool_imd,
      nc_dir:   new_resource.tool_ncd,
      tool_nam: new_resource.tool_name,
      tool_dir: new_resource.tool_dir,
      tool_ver: new_resource.tool_version
    )
    not_if { ::File.exist?(new_resource.tool_lif) }
    mode 0755
    action :create
  end

  execute 'install_tool_w-InstallationManager' do
    command "#{new_resource.tool_imd}/InstallationManager/eclipse/tools/imcl \
    input #{new_resource.temp_dir}/install_nc_tool.xml \
    -log #{new_resource.temp_dir}/install-nc_tool_log.xml \
    -acceptLicense"
    not_if { ::File.exist?(new_resource.tool_lif) }
    user new_resource.nc_act
    group new_resource.nc_grp
    umask '022'
    action :run
  end

  file "#{new_resource.temp_dir}/install_nc_tool.xml" do
    only_if { ::File.exist?(new_resource.tool_lif) }
    action :delete
  end

  directory new_resource.tool_dir do
    only_if { ::File.exist?(new_resource.tool_lif) }
    recursive true
    action :delete
  end
end
