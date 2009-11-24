require 'redmine'

require 'wiki_filter_for_hierarchy'

Redmine::Plugin.register :redmine_wiki_navigation do
  name 'Redmine Wiki Navigation plugin'
  author 'Jean-Baptiste BARTH <jeanbaptiste.barth@gmail.com>'
  description 'This plugin displays a navigation tree in wiki sidebar'
  version '0.1'
end
