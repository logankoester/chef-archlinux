# Fix a Chef Client vulnerability announced September 19 2014.
# I recommend always including this in your run list.
# https://www.getchef.com/blog/2014/09/19/security-releases-chef-client-and-related-products-insecure-file-ownership/

execute 'fix_chef_uid' do
  command 'chown -Rh 0:0 /opt/chef'
  not_if (File.stat('/opt/chef/bin').uid == 0)
end
