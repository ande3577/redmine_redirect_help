class HelpController < ApplicationController
  unloadable
  
  before_filter :get_help_project
  before_filter :get_default_page_id, :only => [:index]
  before_filter :get_wiki_page
  
  helper :attachments
  include AttachmentsHelper

  def index
  end
  
  def show
    render 'index'
  end
  
  private
  def get_help_project
    project_id = Setting.plugin_redmine_redirect_help['help_project']
    return redirect_to(Redmine::Info.help_url) if project_id.nil? or project_id.empty?
    @help_project = Project.find(project_id)
    return render_404 if @help_project.wiki.nil?
  end
  
  def get_default_page_id
    params[:id] = Setting.plugin_redmine_redirect_help['help_wiki_page']
  end
  
  def get_wiki_page
    @page = @help_project.wiki.pages.where(:title => params[:id]).first
    return render_404 if @page.nil?
    @content = @page.content
  end
end
