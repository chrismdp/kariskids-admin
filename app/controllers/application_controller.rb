class ApplicationController < ActionController::Base
  include InheritedResources::DSL

  include SslRequirement
  def ssl_required?
    Rails.env == 'production' || Rails.env == 'staging'
  end

  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :link_family_redirect
  before_filter :default_url_options
  helper :all
  

  def link_family_redirect
    if (current_user && current_user.supporter?)
      redirect_to link_families_path
    end
  end

  def default_url_options
    ActionMailer::Base.default_url_options = { :host => request.host_with_port }
  end
end
