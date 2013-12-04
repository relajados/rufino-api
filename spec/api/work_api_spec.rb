
require "spec_helper"
require "debugger"

describe WorkApi do

  describe 'GET /v1/work/kanbanery/projects' do

    it 'get kanbanery projects' do
      get "/v1/work/kanbanery/projects"
      last_response.status.should == 200
      result = JSON.parse(last_response.body)
      debugger
      result.size.should == 2
    end
  end
end
