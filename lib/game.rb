require_relative 'github/api'

class Game
  ANYOTHEREVENT = 1
  attr_accessor :events, :github_id

  # Initialize dhh_score
  def initialize(github_id)
    @events = {"IssuesEvent": 7,
               "IssueCommentEvent": 6,
               "PushEvent": 5,
               "PullRequestReviewCommentEvent": 4,
               "WatchEvent": 3,
               "CreateEvent": 2
              }
    @github_id = github_id        
  end

  # score of particular github user
  def total_score
    begin
      calculate_score.to_s

    rescue Exception => e
      p e.message
    end
  end

  private

  # data from dhh github url
  def data
    Github::Api.new(github_id).parse
  end


  # calculate the score based on type fetched from parsed json
  def calculate_score
    score = 0

    data.each do |result|
      type = result["type"].to_sym
      if events.has_key? type
        score += events[type]
      else
        score += ANYOTHEREVENT
      end
    end

    score
  end
end

game = Game.new("dhh")
p  "DHH's github score is " + game.total_score