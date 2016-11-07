class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :my_question, only: [:edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    @answer = @question.answers.build
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to questions_path, notice: '質問が投稿されました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path notice: '質問が編集されました'
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

    def set_question
      @question = Question.find(params[:id])
    end

    def my_question
      redirect_to questions_path, notice: 'この操作はできません。' unless @question.user == current_user
    end
end
