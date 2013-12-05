require 'rest_client'
require 'json'

module Kanbanery
  module Helpers

    def call_auth_kanbanery(url)
      RestClient.get(url, { "X-Kanbanery-ApiToken" => KANBANERY_API_TOKEN })
    end

    def get_projects
      projects_url = KANBANERY_API_URL + '/projects'
      JSON.parse(call_auth_kanbanery(projects_url))
    end
  end

  extend Helpers
end
