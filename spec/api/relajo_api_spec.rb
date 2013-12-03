require "spec_helper"
require "debugger"

describe RelajoApi do

  describe 'GET /v1/relajo/buttons' do

    it 'get relajo buttons' do
      Factory :relajo_button, label: 'foo0', url: 'bar0'
      Factory :relajo_button, label: 'foo1', url: 'bar1'

      get "/v1/relajo/buttons"
      last_response.status.should == 200
      result = JSON.parse(last_response.body)

      result.size.should == 2
      result[0]['label'].should == 'foo0'
      result[0]['url'].should == 'bar0'
      result[1]['label'].should == 'foo1'
      result[1]['url'].should == 'bar1'
    end
  end

  describe 'POST /v1/relajo/buttons' do

    it 'create a new relajo buttons' do
      Factory :relajo_button, label: 'foo0', url: 'bar0'

      post "/v1/relajo/buttons", {label: 'foo1', url: 'bar1'}
      last_response.status.should == 201
      result = JSON.parse(last_response.body)
      result['label'].should == 'foo1'
      result['url'].should == 'bar1'

      RelajoButton.count.should == 2
    end
  end
end
