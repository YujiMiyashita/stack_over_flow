class VotesController < ApplicationController
  before_action :set_question_vote, only: [:good, :bad]
  before_action :count_question_votes, only: [:good, :bad]
  before_action :set_answer_vote, only: [:answer_good, :answer_bad]
  before_action :count_answer_votes, only: [:answer_good, :answer_bad]

  def good
    good = current_user.votes.build(question_id: @question.id)
    good.contribution = 1
    good.save
  end

  def bad
    bad = current_user.votes.build(question_id: @question.id)
    bad.contribution = 2
    bad.save
  end

  def answer_good
    good = current_user.votes.build(answer_id: @answer.id)
    good.contribution = 1
    good.save
  end

  def answer_bad
    bad = current_user.votes.build(answer_id: @answer.id)
    bad.contribution = 2
    bad.save
  end

  private
    def set_question_vote
      @question = Question.find(params[:question_id])
    end

    def set_answer_vote
      @answer = Answer.find(params[:answer_id])
    end
    
    #count voted
    def count_question_votes
      redirect_to question_path(@question), notice: 'すでに投票済みです。' if current_user.votes.find_by(question_id: @question.id)
    end

    def count_answer_votes
      redirect_to question_path(@answer.question_id), notice: 'すでに投票済みです。' if current_user.votes.find_by(answer_id: @answer.id)
    end
end
