class UsersController < ApplicationController
  def show
    @name = current_user.name
    @memos = current_user.memos

    favorites = Favorite.where(user_id: current_user.id).order(created_at: :DESC).pluck(:memo_id)
    @favorites = Memo.find(favorites)
  end
end
