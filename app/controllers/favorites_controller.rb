class FavoritesController < ApplicationController
  def create
    @memo = Memo.find(params[:memo_id])
    favorite = current_user.favorites.build(memo_id: params[:memo_id])
    favorite.save
  end

  def destroy
    @memo = Memo.find(params[:memo_id])
    favorite = Favorite.find_by(memo_id: params[:memo_id], user_id: current_user.id)
    favorite.destroy
  end

end
