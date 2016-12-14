class VotesController < ApplicationController
  before_action :set_vote

  def good
    good = current_user.votes.build(question_id: @question.id)
    good.contribution = 1
    good.save
    redirect_to question_path(@question.id)
  end

  def bad
    bad = current_user.votes.build(question_id: @question.id)
    bad.contribution = 2
    bad.save
    redirect_to question_path(@question.id)
  end

  private
    def set_vote
      @question = Question.find(params[:question_id])
    end
end
