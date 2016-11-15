class FavoritesController < ApplicationController

  def create
    current_user.favorites.create(question_id: params[:favorite][:question_id])
    redirect_to questions_path
  end

  def destroy
    favorite = current_user.favorites.find_by(question_id: params[:favorite][:question_id])
    favorite.destroy
    redirect_to questions_path
  end
end
