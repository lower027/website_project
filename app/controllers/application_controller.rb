class ApplicationController < ActionController::Base
    before_action do 
      Rails.application.routes.default_url_options[:host] = request.host 
      ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
    end
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!

    def correct_user?(user)
      user == current_user
    end

    helper_method :correct_user?

    def current_user_admin?
      current_user.admin? == true
    end

    helper_method :current_user_admin?

    def redirect_previous
      redirect_to(session[:previous_url] || root_path)
      session.delete(:previous_url)
    end

    helper_method :redirect_previous

    

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :admin])
    end
end
