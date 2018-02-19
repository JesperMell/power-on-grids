class Admin::MapController < Admin::AdminController
  def index
    @maps = Map.all
  end

  def new
  end

  def edit
  end


end
