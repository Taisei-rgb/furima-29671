class ApplicationController < ActionController::Base
<<<<<<< Updated upstream
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname email password family_name first_name family_name_kana first_name_kana birth_date])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
  end

=======
  before_action :basic_auth

>>>>>>> Stashed changes
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
<<<<<<< Updated upstream
      username == 'admin' && password == '2222'
    end
  end
end
=======
      username == 'test' && password == 'password'
    end
  end
end
>>>>>>> Stashed changes
