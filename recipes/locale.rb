# https://wiki.archlinux.org/index.php/Locale

ruby_block 'Enable desired locales' do
  block do
    locales = node['archlinux']['locales']
    lg = Chef::Util::FileEdit.new('/etc/locale.gen')
    locales.each do |locale|
      lg.search_file_replace_line(/^##{Regexp.escape(locale)}/, locale)
    end
    lg.write_file
  end
end

execute 'Generate locales' do
  command 'locale-gen'
end

execute 'Set system-wide locale' do
  system_locale = node['archlinux']['system_locale']
  command "localectl set-locale LANG=\"#{system_locale}\""
end
