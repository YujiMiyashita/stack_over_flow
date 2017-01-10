class TopController < ApplicationController
  def index
    @questions = Question.all
    @tags = Tag.order("taggings_count DESC").limit(10)
    @title = "上位の質問"
  end
end
