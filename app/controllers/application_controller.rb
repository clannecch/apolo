class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_company
  
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
