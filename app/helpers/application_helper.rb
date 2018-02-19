module ApplicationHelper

  def navbar
    n = []
    n << link_to("Om Oss", "/about")
    if user.present?
      n << user.email || "missing email"
      n << link_to("Logga ut", "/logout")
      n << link_to("Spel", "/public/games")
      # link_to("Kartor", [:admin, :map])
    end
    n
  end

  def user
    return false unless cookies.signed[:user_id].present?
    return User.find(cookies.signed[:user_id])
  end

end
