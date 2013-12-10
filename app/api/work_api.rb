
class WorkApi < Grape::API

  before do
    header "Access-Control-Allow-Origin", "*"
  end

  ApiBase.expand self

  helpers do
  end

  resource :kanbanery do

    get '/login' do
      if params['user'].blank? or params['password'].blank?
        throw :error, message: 'Missing parameter user or password', :status => 401
      end
      Kanbanery.get_user_info(params[:user], params[:password])
    end

    get '/projects' do
      Kanbanery.get_projects
    end

    get '/tasks' do
      if params['project_id'].blank?
        throw :error, message: 'Missing parameter project_id', :status => 401
      end
      Kanbanery.get_tasks(params['project_id'])
    end
  end
end

