
class RelajoApi < Grape::API

  ApiBase.expand self

  helpers do
  end

  get "/buttons" do
    RelajoButton.all.map do |button|
      { label: button.label, url: button.url }
    end
  end

  post "/buttons" do
    if params['url'].blank? || params['label'].blank?
      return { error: 'Params missing' }
    end

    new_button = RelajoButton.new url: params['url'], label: params['label']

    if new_button.save
      { label: new_button.label, url: new_button.url }
    else
      { error: 'Unexpected error' }
    end
  end
end

