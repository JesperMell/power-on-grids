class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      cookies.signed[:user_id] = @user.id
      redirect_to [:public, @user]
    else
      redirect_to '/'
    end
  end

  def destroy
    cookies.signed[:user_id] = nil
    redirect_to :root
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
