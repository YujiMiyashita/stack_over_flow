class VotesController < ApplicationController
  before_action :set_question_vote, only: [:good, :bad]
  before_action :set_answer_vote, only: [:answer_good, :answer_bad]

  def good
    good = current_user.votes.build(question_id: @question.id)
    good.contribution = 1
    good.save
    #redirect_to question_path(@question.id)
  end

  def bad
    bad = current_user.votes.build(question_id: @question.id)
    bad.contribution = 2
    bad.save
    #redirect_to question_path(@question.id)
  end

  def answer_good
    good = current_user.votes.build(answer_id: @answer.id)
    good.contribution = 1
    good.save
    redirect_to question_path(@answer.question.id)
  end

  def answer_bad
    bad = current_user.votes.build(answer_id: @answer.id)
    bad.contribution = 2
    bad.save
    redirect_to question_path(@answer.question.id)
  end

  private
    def set_question_vote
      @question = Question.find(params[:question_id])
    end

    def set_answer_vote
      @answer = Answer.find(params[:answer_id])
    end
end
