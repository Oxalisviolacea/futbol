require 'CSV'
require_relative 'relative_helper'

class StatTracker
  include Calculatable
  attr_reader :game_stats,
              :league_stats,
              :team_stats,
              :season_stats

  def initialize(locations)
    @game_stats = GameStats.new(self)
    @league_stats = LeagueStats.new(self)
    @team_stats = TeamStats.new(self)
    @season_stats = SeasonStats.new(self)
  end

  def self.from_csv(locations)
    StatTracker.new(locations)
  end

  def count_of_teams
    @team_stats.count_of_teams
  end

  def best_offense
    @league_stats.best_offense_stats
    @league_stats.best_offense
  end

  def worst_offense
    @league_stats.worst_offense_stats
    @league_stats.worst_offense
  end

  def highest_scoring_visitor
    @league_stats.team_highest_away_goals
    @league_stats.highest_scoring_visitor
  end

  def highest_scoring_home_team
    @league_stats.team_highest_home_goals
    @league_stats.highest_scoring_home_team
  end

  def lowest_scoring_visitor
    @league_stats.team_lowest_away_goals
    @league_stats.lowest_scoring_visitor
  end

  def lowest_scoring_home_team
    @league_stats.team_lowest_home_goals
    @league_stats.lowest_scoring_home_team
  end

  def winningest_coach(season)
    @season_stats.games_from_season(season)
    @season_stats.group_by_coach(season)
    @season_stats.coach_wins(season)
    @season_stats.winningest_coach(season)
  end

  def worst_coach(season)
    @season_stats.games_from_season(season)
    @season_stats.group_by_coach(season)
    @season_stats.coach_wins(season)
    @season_stats.worst_coach(season)
  end

  def most_accurate_team(season)
    @season_stats.games_from_season(season)
    @season_stats.find_by_team_id(season)
    @season_stats.goals_to_shots_ratio_per_season(season)
    @season_stats.find_most_accurate_team(season)
    @season_stats.most_accurate_team(season)
  end

  def least_accurate_team(season)
    @season_stats.games_from_season(season)
    @season_stats.find_by_team_id(season)
    @season_stats.goals_to_shots_ratio_per_season(season)
    @season_stats.find_least_accurate_team(season)
    @season_stats.least_accurate_team(season)
  end

  def most_tackles(season)
    @season_stats.games_from_season(season)
    @season_stats.find_by_team_id(season)
    @season_stats.total_tackles(season)
    @season_stats.find_team_with_most_tackles(season)
    @season_stats.most_tackles(season)
  end

  def fewest_tackles(season)
    @season_stats.games_from_season(season)
    @season_stats.find_by_team_id(season)
    @season_stats.total_tackles(season)
    @season_stats.find_team_with_fewest_tackles(season)
    @season_stats.fewest_tackles(season)
  end

  def team_info(team_id)
    @team_stats.team_info(team_id)
  end

  def best_season(team_id)
    @team_stats.all_team_games(team_id)
    @team_stats.group_by_season(team_id)
    @team_stats.percent_wins_by_season(team_id)
    @team_stats.best_season(team_id)
  end

  def worst_season(team_id)
    @team_stats.all_team_games(team_id)
    @team_stats.group_by_season(team_id)
    @team_stats.percent_wins_by_season(team_id)
    @team_stats.worst_season(team_id)
  end

  def most_goals_scored(team_id)
    @team_stats.all_team_games(team_id)
    @team_stats.most_goals_scored(team_id)
  end

  def fewest_goals_scored(team_id)
    @team_stats.all_team_games(team_id)
    @team_stats.fewest_goals_scored(team_id)
  end

  def favorite_opponent(team_id)
    @team_stats.find_all_game_ids_by_team(team_id)
    @team_stats.find_opponent_id(team_id)
    @team_stats.hash_by_opponent_id(team_id)
    @team_stats.sort_games_against_rival(team_id)
    @team_stats.find_count_of_games_against_rival(team_id)
    @team_stats.find_percent_of_winning_games_against_rival(team_id)
    @team_stats.favorite_opponent_id(team_id)
    @team_stats.favorite_opponent(team_id)
  end

  def rival(team_id)
    @team_stats.find_all_game_ids_by_team(team_id)
    @team_stats.find_opponent_id(team_id)
    @team_stats.hash_by_opponent_id(team_id)
    @team_stats.sort_games_against_rival(team_id)
    @team_stats.find_percent_of_winning_games_against_rival(team_id)
    @team_stats.rival_opponent_id(team_id)
    @team_stats.rival(team_id)
  end
end
