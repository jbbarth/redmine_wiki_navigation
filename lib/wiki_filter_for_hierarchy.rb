require_dependency 'wiki_controller'

# Adds a before filter to WikiController so that 
# it loads all wiki pages in an OrderedHash, 
# grouped by parend ids. Same as in "special" 
# action, but everywhere since we need the tree
# in all wiki pages.
class WikiController
  before_filter :build_page_hierarchy

  def build_page_hierarchy
    @pages ||= @wiki.pages.find :all, :select => "#{WikiPage.table_name}.*, #{WikiContent.table_name}.updated_on",
                                :joins => "LEFT JOIN #{WikiContent.table_name} ON #{WikiContent.table_name}.page_id = #{WikiPage.table_name}.id",
                                :order => 'title'
    @pages_by_parent_id ||= @pages.group_by(&:parent_id)
  end
end
