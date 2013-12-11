
require "spec_helper"
require "debugger"

describe WorkApi do

  describe 'GET /v1/work/kanbanery/projects' do

    it 'get user info' do
      get "/v1/work/kanbanery/login", {user: 'xx', password: 'xxx'}
      last_response.status.should == 200
      result = JSON.parse(last_response.body)
      result.should_not be_nil
    end

    it 'get kanbanery projects' do
      get "/v1/work/kanbanery/projects", token: token
      last_response.status.should == 200
      result = JSON.parse(last_response.body)
      result.should_not be_nil
    end

    it 'get kanbanery tasks needs a project_id' do
      get "/v1/work/kanbanery/tasks", token: token
      last_response.status.should == 401
    end

    it 'get kanbanery tasks for a project' do
      project_id = '38432'
      get "/v1/work/kanbanery/tasks", { project_id: project_id, token: token }
      last_response.status.should == 200
      result = JSON.parse(last_response.body)
      result.should_not be_nil
    end
  end
end
