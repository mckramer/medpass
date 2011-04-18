class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_user_language  
  
  private  
  def set_user_language 
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      end
    end
  end
  
end
