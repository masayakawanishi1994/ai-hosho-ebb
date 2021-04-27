class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # ログインしていないユーザーをログインページの画面に促す
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    sign_out_user # ユーザーのcookieを削除するメソッドの例
  end

 private

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :officer, :authentication_key] )

  end
end
