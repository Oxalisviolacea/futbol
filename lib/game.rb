class Game
  attr_reader :game_id,
              :season,
              :type,
              :date_time,
              :away_team_id,
              :home_team_id,
              :away_goals,
              :home_goals

  def initialize(game_data)
    @game_id      = game_data[:game_id].to_i
    @season       = game_data[:season].to_s
    @type         = game_data[:type]
    @date_time    = game_data[:date_time]
    @away_team_id = game_data[:away_team_id]
    @home_team_id = game_data[:home_team_id]
    @away_goals   = game_data[:away_goals].to_i
    @home_goals   = game_data[:home_goals].to_i
  end
end
