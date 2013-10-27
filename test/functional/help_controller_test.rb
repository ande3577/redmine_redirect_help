require File.expand_path('../../test_helper', __FILE__)

class HelpControllerTest < ActionController::TestCase
  fixtures 'projects'
  fixtures 'wikis'
  fixtures 'wiki_pages'
  fixtures 'wiki_contents'
  
  def setup
    @wiki = Wiki.first
    @wiki_page = @wiki.pages.first
    @project = @wiki.project
  end
  
  def teardown
    set_redirect_project("")
    set_redirect_wiki("")
  end
  
  def test_redirects_to_redmine_org_if_project_not_defined
    get :index
    assert_redirected_to Redmine::Info.help_url
  end
  
  def test_renders_404_if_project_has_no_wiki
    set_redirect_project
    set_redirect_wiki
    @wiki.destroy
    get :index
    assert_response :missing
  end
  
  def test_renders_404_to_if_wiki_not_defined
    set_redirect_project
    get :index
    assert_response :missing
  end
  
  def test_renders_404_if_wiki_does_not_exist
    set_redirect_project
    set_redirect_wiki("invalid")
    get :index
    assert_response :missing
  end
  
  def test_success_if_wiki_specified
    set_redirect_project
    set_redirect_wiki
    get :index
    assert_response :success
  end
  
  def test_renders_index
    set_redirect_project
    set_redirect_wiki
    get :index
    assert_template :index
  end
  
  def test_rendering_wiki_page_does_not_set_project
    set_redirect_project
    set_redirect_wiki
    get :index
    assert_equal nil, assigns(:project)
  end
  
  def test_assigns_wiki_page
    set_redirect_project
    set_redirect_wiki
    get :index
    assert_equal @wiki_page, assigns(:page)
  end
  
  def test_assigns_content
    set_redirect_project
    set_redirect_wiki
    get :index
    assert_not_nil assigns(:content)
  end
  
  def test_show
    set_redirect_project
    get :show, :id => @wiki_page.title
    assert_response :success
  end
  
  def test_show_also_renders_index
    set_redirect_project
    get :show, :id => @wiki_page.title
    assert_template :index
  end
  
  def test_show_assigns_page
    set_redirect_project
    get :show, :id => @wiki_page.title
    assert_equal @wiki_page, assigns(:page)
  end
  
  def test_show_assigns_content
    set_redirect_project
    get :show, :id => @wiki_page.title
    assert_equal @wiki_page.content, assigns(:content)
  end
  
  private
  def set_redirect_project(project_id = @project.id.to_s)
    Setting.plugin_redmine_redirect_help['help_project'] = project_id
  end
  
  def set_redirect_wiki(wiki_page = @wiki_page.title)
    Setting.plugin_redmine_redirect_help['help_wiki_page'] = wiki_page
  end
  
end
