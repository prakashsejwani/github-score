require 'json'
require 'open-uri'

module Github

  class Api
    attr_accessor :github_url

    # Initialize github api
    def initialize(github_id)
      @github_url = "https://api.github.com/users/" + github_id + "/events/public"
    end

    # parse the github url 
    def parse
      JSON.parse(open(github_url).read)
    end
  end
end