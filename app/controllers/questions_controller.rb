class QuestionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path, notice: '質問が投稿されました'
    else
      render :new
    end
  end

  def edit

  end

  def update
    @question = Question.find(params[:id])
    if @question.save
      redirect_to questions_path, notice: '質問が編集されました'
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: '質問が削除されました'
  end

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end
end
