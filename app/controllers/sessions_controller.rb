class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to new_impression_url, notice: 'ログインしました'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'ログアウトしました'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
