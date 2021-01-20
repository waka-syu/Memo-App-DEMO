class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @memos = @user.memos.order("created_at DESC")

    favorites = Favorite.where(user_id: current_user.id).order(created_at: :DESC).pluck(:memo_id)
    @favorites = Memo.find(favorites)
  end
end
