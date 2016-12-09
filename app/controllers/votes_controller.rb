class VotesController < ApplicationController
  def good
    question = Question.find(params[:question_id])
    good = current_user.votes.build(question_id: question.id)
    good.contribution = 1
    good.save!
    redirect_to question_path(question.id)
  end

  def bad
    question = Question.find(params[:question_id])
    good = current_user.votes.build(question_id: question.id)
    good.contribution = 2
    good.save!
    redirect_to question_path(question.id)
  end
end
