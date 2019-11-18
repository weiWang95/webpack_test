class ApplicationController < ActionController::Base

  around_action :switch_locale

  helper_method :current_user

  private

  def current_user
    @_current_user ||= User.find(session_user_id)
  end

  def session_user_id
    session[:user_id] ||= 1
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
