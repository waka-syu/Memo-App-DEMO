class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @memo = Memp.find(params[:memo_id])
    if @memo.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, memo_id: @memo.id)
    end
  end


end
