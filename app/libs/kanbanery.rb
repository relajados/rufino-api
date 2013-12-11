require 'rest_client'
require 'json'

module Kanbanery
  module Helpers

    def get_user_info(user, password)
      user_url = KANBANERY_API_URL + 'user'

      result = RestClient::Request.new(
        method: :get,
        url: user_url,
        user: user,
        password: password
      ).execute
      JSON.parse(result.to_s)
    end

    def call_auth_kanbanery(url, token)
      RestClient.get(url, { "X-Kanbanery-ApiToken" => token })
    end

    def get_projects(token)
      projects_url = KANBANERY_API_URL + '/projects'
      JSON.parse(call_auth_kanbanery(projects_url, token))
    end

    def get_tasks(project_id)
      tasks_url = KANBANERY_API_URL + "/projects/#{project_id}/tasks"
      JSON.parse(call_auth_kanbanery(tasks_url, token))
    end
  end

  extend Helpers
end
