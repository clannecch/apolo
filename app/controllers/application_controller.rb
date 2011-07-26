class ApplicationController < ActionController::Base
  layout 'apslabs'

  protect_from_forgery

  helper_method :current_company

# paperclip claudio
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
# fin paperclip claudio


  before_filter :check_change_company

  protected

  def check_change_company
    return if params[:cc].blank?
    session[:current_company] = Company.find(params[:cc])
    redirect_to :back
  end

  def current_company
    session[:current_company] || Company.first
  end
end

