class AnswersController < ApplicationController
  before_action :authenticate_user!
  def new

  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to @answer.question, notice: '回答が投稿されました'
    else
      render :template => "questions/show"
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def answer_params
      params.require(:answer).permit(:content, :question_id)
    end
end
