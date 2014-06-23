require 'redmine'
require File.dirname(__FILE__) + '/lib/issues_controller_patch.rb'
require File.dirname(__FILE__) + '/lib/time_entry_patch.rb'

Redmine::Plugin.register :redmine_spent_time_comment_required do
  name 'Redmine Spent Time Comment Required'
  author 'Ivan Petukhov'
  description 'Plugin to require adding spent time comment'
  version '0.0.1'
  url ''
  author_url 'https://github.com/EtherealLich/redmine_spent_time_comment_required'

end
