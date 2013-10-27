module HelpHelper
  def help_page_breadcrumb(page)
    breadcrumb(page.ancestors.reverse.collect {|parent|
      link_to(h(parent.pretty_title), {:controller => 'help', :action => 'show', :id => parent.title })
    })
  end
end
