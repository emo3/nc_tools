# # encoding: utf-8

# Inspec test for recipe nc_tools::make_ncp81

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
    skip 'This is an example test, replace with your own test.'
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
  skip 'This is an example test, replace with your own test.'
end