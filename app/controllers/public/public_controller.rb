class Public::PublicController < ApplicationController
  def index
    @user = User.new
  end
end
