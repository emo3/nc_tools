# nc_tools Cookbook

This cookbook will install probes and/or gateways that specified to install_tool
resource.  See install_tools for an example.
You are required to install Netcool/OMNIbus base software.
Do by including with your .kitchen.yml "recipe[nc_base::make_nc_base]" or
include_recipe 'nc_base::make_nc_base' within a recipe.
This will install the latest versions of the IBM binaries.  If you know of
newer, please let me know.
This does NOT supply any IBM binaries, you will have to do that via PPA.

## Scope

Only install the probe/gateway software.
This will !! NOT !!:
1) configure/setup any probes and/or gateways
  a. You will have to do that yourself
2) configure/setup the Pad to control these

## Requirements

Todo: List any technical requirements for using this cookbook. Do you need to
install binaries from the network? Does the cookbook make other assumptions
about the environment for it to be used? Does the operating system need to have
any special configuration before using this cookbook (i.e. disable selinux)?
Also, tailor the subsections below:

### Platforms

- Redhat 7.x+

### Chef

- Chef 13
- Chef SDK 2.5.3
- Git 2.17
- Vagrant 2.0.4

### Dependencies

- nc_base

## Usage

Todo: This will be unique depending on how the cookbook is developed and the
tools it provides to configure nodes. Here's a simple example of using a
cookbook and it's recipe. You'll want to elaborate on your own steps and include
any necessary steps like setting required attributes.

Place a dependency on the `nc_tools` cookbook in your cookbook's
`metadata.rb`.

```
depends 'nc_tools'
```

Then, in a recipe:

```
include_recipe 'nc_tools::install_tools'
```

If your cookbook provides resources, be sure to include examples of how to use
those resources, in addition to the resources documentation section below.

## Attributes

* `default['nc_tools']['my_attribute']`: Describe the purpose or usage of
  this attribute. Defaults to `somevalue`. Indicate the attribute type if
  necessary.

## Recipes

### default.rb

Todo: Provide a description for the purpose of this recipe file. What does it
do? When would I use it? Does it invoke other recipes?

## Custom Resources

Todo: You only need to provide documentation for custom resources if your
cookbook actually provides them. Not all cookbooks have custom resources. If you
don't known what this means, then your cookbook probably doesn't have them
either and can omit this documentation.

### resource_name

Todo: Add a description or purpose for this resource. What does it do?

#### Actions

* `:do_something`: Description of this action
* `:another_action`: Description of this action

#### Properties

* `property_name` - Description of this property. What is it used for? What is
  it's default value?
* `property_name2` - Description of this property. What is it used for? What is
  it's default value?

#### Examples

todo: Describe this example and what it will accomplish.

```Ruby
# code samples are helpful
nc_tools_resource_name 'some value' do
  property_name 'another value'
  property_name2 'foo bar'
  action :do_something
end
```

And don't forgot to show an example for your other actions.

```Ruby
# code samples are helpful
nc_tools_resource_name 'some value' do
  property_name 'another value'
  property_name2 'foo bar'
  action :another_action
end
```
