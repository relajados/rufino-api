
class WorkApi < Grape::API

  before do
    header "Access-Control-Allow-Origin", "*"
  end

  ApiBase.expand self

  helpers do
  end

  get "/kanbanery/projects" do
    # FIXME
  end
end

