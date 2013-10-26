Redmine::Plugin.register :redmine_redirect_help do
  
  settings :default => {'help_project' => '', 'help_wiki_page' => ''}, :partial => 'settings/redirect_help_settings'
  
  delete_menu_item :top_menu, :help  
  menu :top_menu, :help, { :controller => 'help', :action => 'show' }, :last => true
  
  name 'Redmine Redirect Help plugin'
  author 'David Anderson'
  description 'Redirects the help link at the top of the page to a wiki page'
  version '0.0.1'
  url 'http://github.com/ande3577/redmine_redirect_help'
  author_url 'http://github.com/ande3577'
end
