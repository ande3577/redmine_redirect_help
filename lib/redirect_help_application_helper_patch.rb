require_dependency 'application_helper'

module RedirectHelpApplicationHelperPatch
  
  def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable
        alias_method_chain :textilizable, :help_redirect
      end
  end

  module ClassMethods
  end

  module InstanceMethods
  end
  
  def textilizable_with_help_redirect(*args)
    html = textilizable_without_help_redirect(*args)
    if @help_project
      url_to_match = "/projects/#{@help_project.identifier}/wiki/"
      html.gsub!("href=\"#{url_to_match}", "href=\"/guide/")
    end
    html.html_safe
  end
  
end

ApplicationHelper.send(:include, RedirectHelpApplicationHelperPatch)