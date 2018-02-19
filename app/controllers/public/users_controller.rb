class Public::UsersController < Public::PublicController
  before_action :require_login, only: [:show]

  def show
    user
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      cookies.signed[:user_id] = @user.id
      redirect_to [:public, @user]
    else
      flash[:alert] = @user.errors
      redirect_to :root
    end
  end

  private

  def require_login
    unless cookies.signed[:user_id].present? && cookies.signed[:user_id] == params[:id].to_i
      redirect_to :root
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

 def user
   @user || User.find(params[:id])
 end
end
