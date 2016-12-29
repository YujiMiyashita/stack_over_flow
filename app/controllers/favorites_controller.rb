class FavoritesController < ApplicationController

  def create
    @question = Question.find(params[:favorite][:question_id])
    current_user.favorites.create(question_id: params[:favorite][:question_id])
  end

  def destroy
    @question = Question.find(params[:favorite][:question_id])
    favorite = current_user.favorites.find_by(question_id: params[:favorite][:question_id])
    favorite.destroy
  end
end
