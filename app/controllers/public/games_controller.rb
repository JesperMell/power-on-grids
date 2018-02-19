class Public::GamesController < Public::PublicController
  skip_before_action :verify_authenticity_token, :only => [:add_player]
  def index
    games
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save!
          game_params[:players].each do |player|
              Player.new(user_id: player, game_id: @game.id)
              Player.save
          end
          redirect_to :index
    else

    end
  end

  def add_player
    user(params[:user_id])
    respond_to do |f|
      f.js
    end
  end

  private

  def user(user_id)
    @user ||= User.find(user_id)
  end

  def games
    @games ||= Game.all
  end

  def game_params
    params.require(:game).permit(:name, :map_id, players: [])
  end
end
