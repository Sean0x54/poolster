class FantasyData::Base < Flexirest::Base
  before_request do |name, request|
    request.headers['Ocp-Apim-Subscription-Key'] = Rails.application.secrets.fantasy_data_subscription_key
  end
end
