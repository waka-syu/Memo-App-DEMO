class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_genre_memo

  def genre
    @memos = @q.result
    genre_id = params[:q][:genre_id_eq]
    @genre = Genre.find_by(id: genre_id)
  end

  private

  def search_genre_memo
    @q = Memo.ransack(params[:q])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
