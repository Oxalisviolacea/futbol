require_relative 'test_helper'

class GameTeamsTest < Minitest::Test
  def setup
    @hash = {
      game_id: '2012030221',
      team_id: '3',
      hoa: 'away',
      result: 'LOSS',
      settled_in: 'OT',
      head_coach: 'John Tortorella',
      goals: '2',
      shots: '8',
      tackles: '44'
    }

    @game_teams = GameTeams.new(@hash)
  end

  def test_it_exists_with_attributes
    assert_instance_of GameTeams, @game_teams
  end

  def test_attributes
    assert_equal 2012030221, @game_teams.game_id
    assert_equal 3, @game_teams.team_id
    assert_equal 'away', @game_teams.hoa
    assert_equal 'LOSS', @game_teams.result
    assert_equal 'OT', @game_teams.settled_in
    assert_equal 'John Tortorella', @game_teams.head_coach
    assert_equal 2, @game_teams.goals
    assert_equal 8, @game_teams.shots
    assert_equal 44, @game_teams.tackles
  end
end
