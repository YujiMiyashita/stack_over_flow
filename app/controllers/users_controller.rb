class UsersController < ApplicationController
  def index
    @users = User.all
    @users.each do |user|
      user.contribution_count = user.votes.where(contribution: 1).count - user.votes.where(contribution: 2).count
      user.save
    end
   @users = User.order("contribution_count DESC")
  end

  def show
    @user = User.find(params[:id])
  end
end
