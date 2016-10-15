class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end
end
