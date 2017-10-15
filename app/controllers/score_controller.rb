class ScoreController < ApplicationController
  
  def index
    Score.generate_score
    user = User.find_by_car(params[:user])
    last_scores = {}
    if user
      last_scores = user.scores.where("created_at > ?", params[:last_updated]).order("created_at DESC").limit(15).select(:score, :created_at)
    end
    render :json => last_scores
  end

end

