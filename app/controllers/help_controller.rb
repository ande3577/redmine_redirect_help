class HelpController < ApplicationController
  unloadable
  
  before_filter :get_wiki
  
  helper :attachments
  include AttachmentsHelper

  def show
    @content = @page.content
  end
  
  private
  def get_wiki
    project_id = Setting.plugin_redmine_redirect_help['help_project']
    return redirect_to(Redmine::Info.help_url) if project_id.nil? or project_id.empty?
    project = Project.find(project_id)
    wiki_page = Setting.plugin_redmine_redirect_help['help_wiki_page']
    return render_404 if project.wiki.nil?
    @page = project.wiki.pages.where(:title => wiki_page).first
    return render_404 if @page.nil?
  end
end
