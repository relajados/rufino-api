
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
      if params['token'].blank?
        throw :error, message: 'Missing token parameter', :status => 401
      end
      Kanbanery.get_projects(params[:token])
    end

    get '/tasks' do
      if params['project_id'].blank? or params['token'].blank?
        throw :error, message: 'Missing parameter token or project_id', :status => 401
      end
      Kanbanery.get_tasks(params['project_id'], params['token'])
    end
  end
end

