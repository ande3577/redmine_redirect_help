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
    @wiki = @help_project.wiki
    return render_404 if @wiki.nil?
  end
  
  def get_default_page_id
    params[:id] = Setting.plugin_redmine_redirect_help['help_wiki_page']
    return render_404 if params[:id].nil? or params[:id].empty?
  end
  
  def get_wiki_page
    @page = @wiki.find_page(params[:id])
    return render_404 if @page.nil?
    return redirect_to params.update(:id => @page.title) if @wiki.page_found_with_redirect?
    @content = @page.content
  end
end
