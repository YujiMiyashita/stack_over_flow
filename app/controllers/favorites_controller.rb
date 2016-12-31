class FavoritesController < ApplicationController
  before_action :set_question

  def create
    @question = Question.find(params[:favorite][:question_id])
    current_user.favorites.create(question_id: @question.id)
  end

  def destroy
    @question = Question.find(params[:favorite][:question_id])
    favorite = current_user.favorites.find_by(question_id: @question.id)
    favorite.destroy
  end

  private
    def set_question
      @question = Question.find(params[:favorite][:question_id])
    end
end
