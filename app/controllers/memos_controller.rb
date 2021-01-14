class MemosController < ApplicationController
  def index
    @memos = Memo.order("created_at DESC").includes(:user)
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def attach
    attachment = Attachment.create! image: params[:image]
    render json: { filename: url_for(attachment.image)}
  end

  def favorites
    @memos = current_user.favorite_memos.includes(:user)
  end

  private

  def memo_params
    params.require(:memo).permit(:title, :content, :genre_id).merge(user_id: current_user.id)
  end
end
