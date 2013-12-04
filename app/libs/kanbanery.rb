module Kanbanery
  module Helpers

    ACCESS_TOKEN = ENV['KANBANERY_APIKEY']

    def call_auth_kanbanery(url)
      RestClient.get(url, { "X-Kanbanery-ApiToken" => ACCESS_TOKEN })
    end

    def get_projecs
      projects_url = KANBANERY_BASE_URL + '/projects'
      JSON.parse(call_auth_kanbanery(projects_url))
    end
  end

  extend Helpers
end
