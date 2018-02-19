module SessionsHelper
  def logged_in?
    cookies.signed[:user_id] && User.find(cookies.signed[:user_id])
  end

  def current_user
    User.find(cookies.signed[:user_id])
  end
end
