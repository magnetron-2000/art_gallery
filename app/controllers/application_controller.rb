class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  around_action :switch_locale

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/' unless logged_in?
  end

  def default_url_options #Setting the Locale from URL Params
    {locale: I18n.locale}
  end

  def switch_locale(&action)  # set up locale if locale exist else default locale

    locale = extract_locale_from_tld || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
end
