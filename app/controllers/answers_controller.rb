class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:edit, :update, :destroy]

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to @answer.question, notice: '回答が投稿されました'
    else
      render template: "questions/show"
    end
  end

  def edit

  end

  def update
    if @answer.update(answer_params)
      redirect_to question_path(@answer.question_id), notice: '回答が編集されました'
    else
      render template: "questions/show"
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@answer.question_id), notice: '回答が削除されました'
  end

  private
    def answer_params
      params.require(:answer).permit(:content, :question_id)
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end
end
