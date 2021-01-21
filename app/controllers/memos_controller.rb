class MemosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :search_genre_memo
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

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
    @comment = Comment.new
    @comments = @memo.comments.includes(:user)
  end

  def edit
    unless current_user.id == @memo.user.id
      redirect_to action: :index
    end
  end

  def update
    if @memo.update(memo_params)
      redirect_to memo_path(@memo.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @memo.user.id
      @memo.destroy
    end
    redirect_to root_path
  end

  def attach
    attachment = Attachment.create! image: params[:image]
    render json: { filename: url_for(attachment.image)}
  end

  def favorites
    @memos = current_user.favorite_memos.includes(:user)
  end

  def genre
    @memos = @q.result
    genre_id = params[:q][:genre_id_eq]
    @genre = Genre.find_by(id: genre_id)
  end

  private

  def search_genre_memo
    @q = Memo.ransack(params[:q])
  end

  def memo_params
    params.require(:memo).permit(:title, :content, :genre_id).merge(user_id: current_user.id)
  end

  def set_memo
    @memo = Memo.find(params[:id])
  end
end
