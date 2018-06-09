module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authenticate_user!
    unless logged_in?
      redirect_to root_url, notice: 'ログインしてください'
    end
  end
end
