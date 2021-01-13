class UsersController < ApplicationController
  def show
    @name = current_user.name
    @memos = current_user.memos
  end
end
