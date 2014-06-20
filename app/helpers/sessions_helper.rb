module SessionsHelper
  include UsersHelper
  def sign_in user, remember = false
    remember_token = SecureRandom.urlsafe_base64
    cookies.permanent[:remember_token] ={
        value: remember_token,
        expires: remember ? 2.weeks.from_now : nil
    }
    user.no_password_validation = true
    user.update_attributes remember_token: remember_token
    user.no_password_validation = false
    @current_user = user
  end

  def sign_out
    current_user = nil
    cookies.delete :remember_token
  end

  def current_user user
    self.current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token cookies[:remember_token]
  end

  def correct_user? user
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    redirect_to signin_path, notice: 'Please sign in' unless signed_in?
  end

  def signed_in_admin
    redirect_to root_path, notice: 'You do not have permission' unless current_user.admin?
  end

  def redirect_back
    if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to root_url
    end
  end

  def redirect_back_or default
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
end
