class GroupController < ApplicationController
  def index
    Score.generate_score
    result = {}
    User.find_by_car(params[:user]).groups.each do |group|
      participants = []
      group.users.each do |user|
        participants.push({
            "firstname":user.firstname,
            "lastname":user.lastname,
            "score":Score.where("user_id = ?", user.id).order("created_at DESC").first.score
        })
      end
      result[group.name] = participants
    end
    render :json => result
  end
end
