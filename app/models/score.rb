class Score < ApplicationRecord
  belongs_to :user

  def self.generate_score
    self.group("user_id").having('time = MAX(time)').each do |score|
      current_user = score.user
      query = {
          "from" => score.created_at.strftime("%d/%m/%YT%H:%M:%S"),
          "limit" => 1000
      }
      headers = {
          "IDENTITY_KEY"  => current_user.car
      }
      new_time = score.created_at-16.seconds-56.minutes-1.hour
      print new_time
      params = {"from":score.time, limit:1000}.to_query
      query_string = "https://api.thingtia.cloud/data/"+current_user.car_name+"?"+params
      print (query_string+"\n")
      blub = HTTParty.get(
          query_string,
          :headers => headers
      )
      self.use_values(blub.parsed_response, current_user, score)

    end
  end

  private

  def self.use_values(response, user, score)
    if response["sensors"] != nil
      response["sensors"].each do |sensor|
        if (sensor["sensor"] == "marius_acc" && user.firstname == "Marius")
          observations = sensor["observations"].select{|item| item["value"] != 0}
          new = []
          time = observations.first["timestamp"]
          observations.map{|ob| new.push(ob["value"].to_i.abs)}
          while new.size > 3
            new_score = score.score - ((new.shift(4).sum / 4) - 10) * 3
            Score.create(:user => user, :score => new_score, :time => time)
          end
        end
        if (sensor["sensor"] == "annikas_acc" && user.firstname == "Annika")
          observations = sensor["observations"].select{|item| item["value"] != 0}
          new = []
          time = observations.first["timestamp"]
          observations.map{|ob| new.push(ob["value"].to_i.abs)}
          while new.size > 3
            new_score = score.score - ((new.shift(4).sum / 4) - 10) * 3
            Score.create(:user => user, :score => new_score, :time => time)
          end
        end
        if (sensor["sensor"] == "mohammeds_acc" && user.firstname == "Mohammed")
          observations = sensor["observations"].select{|item| item["value"] != 0}
          new = []
          time = observations.first["timestamp"]
          observations.map{|ob| new.push(ob["value"].to_i.abs)}
          while new.size > 3
            new_score = score.score - ((new.shift(4).sum / 4) - 10) * 3
            Score.create(:user => user, :score => new_score, :time => time)
          end
        end
        if (sensor["sensor"] == "marius_dis" && user.firstname == "Marius")
          observations = sensor["observations"].select{|item| item["value"] != 0}
          new = []
          time = observations.first["timestamp"]
          observations.map{|ob| new.push(ob["value"].to_i.abs)}
          while new.size > 3
            new_score = score.score + (((new.shift(4).sum / 4) - 20) / 10)
            Score.create(:user => user, :score => new_score, :time => time)
          end
        end
        if (sensor["sensor"] == "annikas_dis" && user.firstname == "Annika")
          observations = sensor["observations"].select{|item| item["value"] != 0}
          new = []
          time = observations.first["timestamp"]
          observations.map{|ob| new.push(ob["value"].to_i.abs)}
          while new.size > 3
            new_score = score.score + (((new.shift(4).sum / 4) - 20) / 10)
            Score.create(:user => user, :score => new_score, :time => time)
          end
        end
        if (sensor["sensor"] == "mohammeds_dis" && user.firstname == "Mohammed")
          observations = sensor["observations"].select{|item| item["value"] != 0}
          new = []
          time = observations.first["timestamp"]
          observations.map{|ob| new.push(ob["value"].to_i.abs)}
          while new.size > 3
            new_score = score.score + (((new.shift(4).sum / 4) - 20) / 10)
            Score.create(:user => user, :score => new_score, :time => time)
          end
        end
      end
    end
  end

end
