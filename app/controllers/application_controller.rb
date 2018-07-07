class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def correct_user(user)
    if user != current_user
      fedirect_to user_url(current_user), notice: '不正な操作が実行されました'
    end
  end
end
